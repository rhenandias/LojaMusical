package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.StatusMethod;
import models.UsuarioModel;

/**
 * Servlet implementation class AtivacaoConta
 */
@WebServlet("/AtivacaoConta")
public class AtivacaoConta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AtivacaoConta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher tagFile = null;
		String codigo = request.getParameter("codigo");
		String idUsuario = request.getParameter("id");
		
		try {
			
			UsuarioModel usuario = new UsuarioModel(Integer.parseInt(idUsuario));
			StatusMethod st = usuario.ativarUsuario(codigo);
			
			request.setAttribute("status", st.getStatus().toString().toLowerCase());
			request.setAttribute("statusTitulo", st.getTitulo());
			request.setAttribute("statusTexto", st.getMensagem());
		} catch (NumberFormatException e) {
			request.setAttribute("status", "error");
			request.setAttribute("statusTitulo", "Erro!!");
			request.setAttribute("statusTexto", "Não existe este usuario!!");
			e.printStackTrace();
		} catch (SQLException e) {
			request.setAttribute("status", "error");
			request.setAttribute("statusTitulo", "Erro!!");
			request.setAttribute("statusTexto", "Não existe este usuario ou o código está invalido!!");
			
			e.printStackTrace();
		}
		

		tagFile = getServletContext().getRequestDispatcher("/View/Usuario/ativacaoUsuario.jsp");
		tagFile.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
