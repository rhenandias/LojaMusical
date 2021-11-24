package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.BuscaModel;
import models.ProdutoModel;

@WebServlet("/busca/*")
public class BuscaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
	
		switch(action) {
		case "resultados": {
			RequestDispatcher tagFile = getServletContext().getRequestDispatcher("/View/busca.jsp");
			tagFile.forward(request, response);
		} break;
		case "buscar": {
			// Realizar busca e retornar resultados como Json
			String pesquisa = "";
			
			if(request.getParameter("pesquisa") != null) {
				pesquisa = request.getParameter("pesquisa");
			}
			
			System.out.println("Recebendo como parametro de busca: " + pesquisa);
			
			BuscaModel busca = new BuscaModel(pesquisa);
			String resultados = busca.buscar();
			response.getWriter().write(resultados);
		} break;
		default:
			response.getWriter().write("Outra página");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pesquisa", request.getParameter("pesquisa"));
		RequestDispatcher tagFile = getServletContext().getRequestDispatcher("/View/busca.jsp");
		tagFile.forward(request, response);
	}

}
