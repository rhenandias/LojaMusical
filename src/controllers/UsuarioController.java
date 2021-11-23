package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UsuarioModel;

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
			response.getWriter().write("Outra pÃ¡gina");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		String[] parametros = {"email", "senha", "nome_completo", "cpf", "telefone", "endereco", "numero", "bairro", "cidade", "uf", };
		Map<String, String> pValues = new HashMap<String, String>();
		
		
		
		if (action.equals("cadastrar")) {
			
			Arrays.stream(parametros).forEach(parameter -> {
				pValues.put(parameter, request.getParameter(parameter));
			});
			
			UsuarioModel userCadastro = new UsuarioModel(
					pValues.get("nome_completo"), pValues.get("email"), pValues.get("telefone"), 
					pValues.get("senha"), pValues.get("cpf"), false, "", pValues.get("endereco"), pValues.get("numero"),
					pValues.get("bairro"), pValues.get("cidade"), pValues.get("estado")
					);
			try {
				if (!userCadastro.existCadastro()) {
					userCadastro.cadastrarNoBanco();
					request.setAttribute("status", "success");
					request.setAttribute("statusTitulo", "Sucesso!!");
					request.setAttribute("statusTexto", "Cadastrado com sucesso!! Verifique seu email para ativação");
					
				} else {
					request.setAttribute("status", "error");
					request.setAttribute("statusTitulo", "Erro!!");
					request.setAttribute("statusTexto", "Esse usuario já existe no sistema!");
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			
		}
		doGet(request, response);
	}

}
