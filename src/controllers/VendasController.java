package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;
import models.VendaModel;
import services.PedidoService;


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
			
			response.getWriter().write(vendas.listar());
			break;
		case "atualizarStatus":
			String idVenda = request.getParameter("idVenda");
			String idStatus = request.getParameter("statusAndamento");
			DB.executarQuery("UPDATE `Venda` SET idStatus = " + idStatus + " WHERE idVenda = " + idVenda + ";", true);
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

}
