package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;
import models.StatusMethod;
import models.enums.STATUS;


@WebServlet("/estoque")
public class EstoqueController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EstoqueController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getAttribute("key") != null ? (String) request.getAttribute("key") : "";
		
		switch (key) {
		case "retornarJson":
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write((String) request.getAttribute("statusJson"));
			break;

		default:
			RequestDispatcher tagFile = null;
			tagFile = getServletContext().getRequestDispatcher("/View/estoque.jsp");
			tagFile.forward(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		StatusMethod st = null;
		String action = request.getParameter("action");
		
		try {
			if (action.equals("adicionar")) {
				Integer idProduto = Integer.parseInt(
							request.getParameter("idProduto")
						);
				
				Integer quantidade = Integer.parseInt(
							request.getParameter("quantidade")
						);
				
				if (idProduto != null && quantidade > 0) {
					DB.executarQuery("UPDATE `Produto` SET quantidade = quantidade + " + quantidade + " WHERE idProduto = " + idProduto + ";", true);
					st = new StatusMethod(STATUS.SUCCESS, "Quantidade adicionada com sucesso!!", "A quantidade requerida foi adicionada com sucesso!");
				} else {
					st = new StatusMethod(STATUS.ERROR, "Produto não existe ou a quantidade é menor que 1", "Só conseguimos adicionar se o produto existir e a quantidade para adicionar for maior que 0");
				}
				
			} else {
				st = new StatusMethod(STATUS.ERROR, "Não conhecemos esta ação", "Desculpe, nao conhecemos a ação " + action);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			st = new StatusMethod(STATUS.ERROR, "Erro no controller estoque", "Alguns parâmetros passados deveriam ser inteiros. Cheque o que está passando");
		}
		
		request.setAttribute("key", "retornarJson");
		request.setAttribute("statusJson", st.retornarEmFormatoJson());
		doGet(request, response);
	}

}
