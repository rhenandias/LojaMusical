package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.CategoriaModel;
import models.ProdutoModel;

/**
 * Servlet implementation class ProdutoController
 */
@WebServlet("/produto/*")
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdutoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch(action) {
		case "listar": {

			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String idCategoria = "";
			String limit = "";
			
			if(request.getParameter("idCategoria") != null) {
				idCategoria = request.getParameter("idCategoria");
			}

			if(request.getParameter("limit") != null) {
				limit = request.getParameter("limit");
			}
			
			ProdutoModel produto = new ProdutoModel();
			String produtos = produto.listar(idCategoria, limit);
			
			response.getWriter().write(produtos);
		} break;
		case "teste": {
			RequestDispatcher tagFile = null;
			tagFile = getServletContext().getRequestDispatcher("/View/produto.jsp");
			tagFile.forward(request, response);
		} break;
		default:
			response.getWriter().write("Outra página");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
