package controllers;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonObject;

@WebServlet("/carrinho/*")
public class CarrinhoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarrinhoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher tagFile = null;
		String uri = request.getRequestURI();
		tagFile = getServletContext().getRequestDispatcher("/View/carrinho.jsp");
		
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch (action) {
			case "inserirProduto" : {
				try {
					String idProduto = request.getParameter("idProduto");
					String quantidade = request.getParameter("quantidade");
					Date date = new Date();
					String cookieName = "carrinho" + "_id-" + idProduto + "_qtd-" + quantidade + "_" + String.valueOf(date.hashCode());
					Cookie cookie = new Cookie(cookieName, idProduto);
					cookie.setMaxAge(60*60*24);
					cookie.setSecure(true);
					response.addCookie(cookie);
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			}
			case "removerProduto": {
				try {
					 Cookie cookies[] = request.getCookies();
					 Arrays.stream(cookies).forEach(x -> {
						 if (x.getName().equals(request.getParameter("cookieName"))) {
							 x.setMaxAge(0);
							 response.addCookie(x);
						 }
					 });
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			default:
				Cookie cookies[] = request.getCookies();
				break;
				
				
				
		}
		
		
		tagFile.forward(request, response);
		//JsonObject innerObject = new JsonObject();
		//innerObject.addProperty("idProduto", query.getString("idProduto"));
		
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request, response);
	}

}
