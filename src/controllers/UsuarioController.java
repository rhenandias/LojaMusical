package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/usuario/*")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UsuarioController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		RequestDispatcher tagFile = null;
		
		switch(action) {
		case "cadastrar": {
			tagFile = getServletContext().getRequestDispatcher("/View/Usuario/cadastroUsuario.jsp");
			tagFile.forward(request, response);
		} break;
		case "login": {
			tagFile = getServletContext().getRequestDispatcher("/View/Usuario/loginUsuario.jsp");
			tagFile.forward(request, response);
		} break;
		default:
			response.getWriter().write("Outra página");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
