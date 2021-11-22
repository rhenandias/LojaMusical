package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.CategoriaModel;

/**
 * 
 * @author Rhenan, samuel e jo„o
 * 
 * 
 * @param = {listar; id_da_categoria}
 * 
 * 		id_da_categoria - Mostra os produtos da categoria
 * 		listar - lista todos os produtos
 *
 */
@WebServlet("/categoria/*")
public class CategoriaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoriaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		response.setContentType("application/json");
		switch(action) {
		case "listar":
			CategoriaModel categoria = new CategoriaModel();
			String categorias = categoria.listar();
			response.getWriter().write(categorias);
			
			break;
		default:
			response.getWriter().write("Outra p√°gina");
		}
		
		RequestDispatcher tagFile = null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
