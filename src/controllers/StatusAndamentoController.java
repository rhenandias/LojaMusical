package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.StatusModel;
import models.VendaModel;

@WebServlet("/statusAndamento/*")
public class StatusAndamentoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StatusAndamentoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch (action) {
		case "listar":
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			StatusModel status = new StatusModel();
			
			response.getWriter().write(status.listar());
			break;

		default:
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
