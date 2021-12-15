package controllers;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.DB;
import models.UsuarioModel;
import models.VendaModel;
import models.vendas.PedidoVenda;
import services.PedidoService;
import services.UsuarioService;


@WebServlet("/vendas/*")
public class VendasController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VendasController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch (action) {
		case "listar":
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			VendaModel vendas = new VendaModel();
			
			List<VendaModel> vendasList=  vendas.listarEmArray();
			
			List<PedidoVenda> pedidosVendas = new ArrayList<>();
			
			
			vendasList.forEach(venda -> {
				
				String stringIdVenda = String.valueOf( venda.getIdVenda() );
				PedidoVenda pedidoVenda = getPedidoVenda(stringIdVenda);
				pedidosVendas.add(pedidoVenda);
			});
			
			String jsonListar = new Gson().toJson(pedidosVendas);
			
			response.getWriter().write(jsonListar);
			break;
		case "atualizarStatus":
			String idVenda = request.getParameter("idVenda");
			String idStatus = request.getParameter("statusAndamento");
			DB.executarQuery("UPDATE `Venda` SET idStatus = " + idStatus + " WHERE idVenda = " + idVenda + ";", true);
			break;
		case "pegarInformaçõesDaVenda":
			try {
				String idVendaString = request.getParameter("idVenda");
				ResultSet rs = DB.executarQuery("SELECT * FROM `Venda` WHERE idVenda = " + idVendaString);
				rs.next();
				
				Date date = null;
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				try {
					date = format.parse(rs.getString("data"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				VendaModel venda = new VendaModel(rs.getInt("idVenda"), rs.getInt("idUsuario"), rs.getInt("idStatus"), date, rs.getFloat("valor"));
				
				UsuarioModel usuario = new UsuarioModel(venda.getIdUsuario());
				
				usuario.setSenha("");
				usuario.setCodigoAtivacao("");
				
				
				List<String> produtos = new ArrayList<>();
				ResultSet rs2 = DB.executarQuery("SELECT p.nome FROM VendaProduto vp\r\n" + 
						"INNER JOIN Produto p ON p.idProduto = vp.idProduto where vp.idVenda = "+ venda.getIdVenda() + ";");
				while (rs2.next()) {
					produtos.add(rs2.getString("nome"));
				}
				
				PedidoVenda pedidoVenda = new PedidoVenda(venda, usuario, produtos);
				
				String json = new Gson().toJson(pedidoVenda);
				
				
				response.setContentType("text/json; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		default:
			RequestDispatcher tagFile = null;
			tagFile = getServletContext().getRequestDispatcher("/View/vendas.jsp");
			tagFile.forward(request, response);
			break;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public PedidoVenda getPedidoVenda(String idVendaString) {
		try {
		ResultSet rs = DB.executarQuery("SELECT * FROM `Venda` WHERE idVenda = " + idVendaString);
		rs.next();
		
		Date date = null;
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = format.parse(rs.getString("data"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		VendaModel venda = new VendaModel(rs.getInt("idVenda"), rs.getInt("idUsuario"), rs.getInt("idStatus"), date, rs.getFloat("valor"));
		
		UsuarioModel usuario = new UsuarioModel(venda.getIdUsuario());
		
		usuario.setSenha("");
		usuario.setCodigoAtivacao("");
		
		
		List<String> produtos = new ArrayList<>();
		ResultSet rs2 = DB.executarQuery("SELECT p.nome FROM VendaProduto vp\r\n" + 
				"INNER JOIN Produto p ON p.idProduto = vp.idProduto where vp.idVenda = "+ venda.getIdVenda() + ";");
		while (rs2.next()) {
			produtos.add(rs2.getString("nome"));
		}
		
		PedidoVenda pedidoVenda = new PedidoVenda(venda, usuario, produtos);
		
		return pedidoVenda;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
