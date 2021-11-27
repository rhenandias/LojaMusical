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
 * @author Rhenan, samuel e jo�o
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
		RequestDispatcher tagFile = null;
		
		switch(action) {
		case "listar":
			// Listar categorias e retornar como JSON
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			// Model da categoria
			CategoriaModel categoria;
			
			// Verifica se foi solicitado listagem de uma categoria específica ou uma listagem geral
			
			if(request.getParameter("id") != null) {
				// Solicitado listagem de uma categoria específica
				String 	id = request.getParameter("id");
				categoria = new CategoriaModel(id);
				String resultado = categoria.ler();
				response.getWriter().write(resultado);
				
			} else {
				// Solicitado listagem geral de categorias
				categoria = new CategoriaModel();
				String resultado = categoria.listar();
				response.getWriter().write(resultado);
			}
			
			break;
		case "info": {
			// Exibir tela de informação de categoria
			tagFile = getServletContext().getRequestDispatcher("/View/categoria.jsp");
			tagFile.forward(request, response);
		} break;
		default:
			response.getWriter().write("Outra página");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
