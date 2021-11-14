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
		
		String idCategoria = "";
		String limit = "";
		
		if(request.getParameter("idCategoria") != null) {
			idCategoria = request.getParameter("idCategoria");
		}

		if(request.getParameter("limit") != null) {
			limit = request.getParameter("limit");
		}
		
		switch(action) {
		case "listar": {
			ProdutoModel produto = new ProdutoModel();
			String produtos = produto.listar(idCategoria, limit);
			response.getWriter().write(produtos);
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
