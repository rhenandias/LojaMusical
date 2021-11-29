package controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.BuscaModel;
import models.CategoriaModel;
import models.ProdutoModel;
import models.StatusMethod;
import models.enums.STATUS;
import multitool.Utilities;

@WebServlet("/produto/*")
@MultipartConfig
public class ProdutoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdutoController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		switch(action) {
		case "listar": {
			// Busca produtos e retorna resposta como JSON
			
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String idCategoria = "";
			String limit = "100";
			
			if(request.getParameter("idCategoria") != null) {
				idCategoria = request.getParameter("idCategoria");
			}

			if(request.getParameter("limit") != null) {
				limit = request.getParameter("limit");
			}
			
			ProdutoModel produto = new ProdutoModel();
			String produtos = produto.listar(idCategoria, limit);
			
			response.getWriter().write(produtos);
		} break;
		case "info": {
			// Exibir tela de informa√ß√£o de produto
			RequestDispatcher tagFile = null;
			tagFile = getServletContext().getRequestDispatcher("/View/produto.jsp");
			tagFile.forward(request, response);
		} break;
		case "buscar": {
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			String id = "";
			
			if(request.getParameter("id") != null) {
				id = request.getParameter("id");
			}
						
			ProdutoModel produto = new ProdutoModel(id);
			String resultados = produto.ler();
			response.getWriter().write(resultados);
		} break;
		case "cadastrar":
			RequestDispatcher tagFile = null;
			tagFile = getServletContext().getRequestDispatcher("/View/produto/cadastrarProduto.jsp");
			tagFile.forward(request, response);
			break;
		default:
			response.getWriter().write("Outra p√°gina");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String[] parametros = {"idCategoria", "idFornecedor", "nome", "marca", "imagem", "preco", "custo", "quantidade", "descricao"};
		Map<String, String> paramHashMap = new HashMap<String, String>();
		boolean boolFezUpload = false;
		StatusMethod st = null;
		
		if (action.equals("cadastrar")) {
			Arrays.stream(parametros).forEach(parameter -> {
				paramHashMap.put(parameter, request.getParameter(parameter));
			});
			
			/**
			 * Pega a imagem como um 'part'. Algo destinado a pegar imagem de forms
			 */
			Part part = request.getPart("imagem");
			String fileName = part.getSubmittedFileName();
			
			//Gera um codigo randomico para o inicio do arquivo
			Date date = new Date();
			String nomeArquivo = Utilities.gerarCodigoAleatorio(4) + "_" +date.hashCode() + "_" + fileName;
			paramHashMap.put("imagem", nomeArquivo);
			
			/**
			 * Cria o model do produto e o cadastra
			 * 
			 */
			ProdutoModel produto = new ProdutoModel(
					null, paramHashMap.get("idCategoria"),
					paramHashMap.get("idFornecedor"), paramHashMap.get("nome"),
					paramHashMap.get("marca"), paramHashMap.get("preco"), paramHashMap.get("custo"),
					paramHashMap.get("quantidade"), paramHashMap.get("imagem"), paramHashMap.get("descricao"));
			
			StatusMethod produtoCadastrado;
			try {
				produtoCadastrado = produto.cadastrarNoBanco();
			} catch (Exception e) {
				e.printStackTrace();
				produtoCadastrado = new StatusMethod(STATUS.ERROR, "Falha ao cadastrar o produto no banco de dados!", "Verifique o erro no console");;
			}
					
			if (produtoCadastrado != null && produtoCadastrado.getStatus() != STATUS.ERROR) {
				String path = getServletContext().getRealPath("/"+"FotosProdutos" + File.separator + paramHashMap.get("imagem"));
				InputStream is = part.getInputStream();
				
				boolFezUpload = uploadFile(is, path);
				
				
				if (boolFezUpload) {
					st = new StatusMethod(STATUS.SUCCESS, "Cadastrado com sucesso", "Upload dos dados feitos com sucesso");
				} else {
					st = new StatusMethod(STATUS.ERROR, "Erro ao cadastrar", "N„o foi possÌvel fazer o upload");
				}
			} else {
				 st = produtoCadastrado;
			}
			
			request.setAttribute("status", st.status.toString().toLowerCase());
			request.setAttribute("statusTitulo", st.getTitulo());
			request.setAttribute("statusTexto", st.getMensagem());
			
			
		}
		doGet(request, response);
	}
	
	public boolean uploadFile(InputStream is, String path) {
		boolean fezUpload = false;
		try {
			FileOutputStream fops = new FileOutputStream(path);
			byte[] byt = new byte [is.available()];
			int bytesRead;
		    while ((bytesRead = is.read(byt)) > 0) {
		        fops.write(byt, 0, bytesRead);
		    }
			
			// fops.flush();
			fops.close();
			
			fezUpload = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fezUpload;
	}

}
