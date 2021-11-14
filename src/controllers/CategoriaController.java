package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.CategoriaModel;

@WebServlet("/categoria/*")
public class CategoriaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoriaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 
		String categoria = request.getParameter("categoria");
		request.setAttribute("categoria", categoria);
		RequestDispatcher tagFile = getServletContext().getRequestDispatcher("/View/categoria.jsp");
		tagFile.forward(request, response);
		
		*/
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		RequestDispatcher tagFile = null;
		
		switch(action) {
		case "listar": {
			CategoriaModel categoria = new CategoriaModel();
			String categorias = categoria.listar();
			response.getWriter().write(categorias);
		} break;
		default:
			response.getWriter().write("Outra página");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
