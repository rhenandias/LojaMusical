package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.JsonObject;

import models.CookieCreator;
import models.ProdutoModel;
import models.StatusMethod;
import models.enums.STATUS;
import services.ProdutoService;

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
			/**
			 * Cria o cookie do produto para adicionar no carrinho
			 * Caso o cookie desse produto jah exista e pede pra criar outro, ele irá somar a quantidade dos cookies,
			 * 		remover os antigos e adicionar um novo atualizado.
			 */
			case "inserirProduto" : {
				try {
					//Pega os parametros da requisição
					String idProduto = request.getParameter("idProduto");
					String quantidade = request.getParameter("quantidade");
					
					//Cria o cookieCreator (facilita a criação do nome do cookie)
					CookieCreator cookieC = new CookieCreator();
					cookieC.setId(Integer.valueOf(idProduto));
					cookieC.setQuantidade(Integer.valueOf(quantidade));
					cookieC.setTipo("carrinho");
					cookieC.criarNomeCookie();
					
					//Verifica se tem um cookie existente
					Cookie cookieExistente;
					try {
					cookieExistente = Arrays.stream(request.getCookies())
						.filter(
								x -> x.getName().split("qtd")[0].equals(cookieC.getNomeCookie().split("qtd")[0])
								)
						.findFirst()
						.get();
					} catch (NoSuchElementException e) {
						cookieExistente = null;
					}
					
					
					if (cookieExistente != null) {
						//Remove o cookie antigo
						cookieExistente.setMaxAge(0);
						response.addCookie(cookieExistente);
						
						//Cria um cookie com a quantidade do produto atualizada
						CookieCreator cookieCExistente = new CookieCreator();
						cookieCExistente.pegarValoresPeloNomeCookie(cookieExistente.getName());
						if (cookieExistente.getMaxAge() > 0) {
							cookieC.setQuantidade(cookieC.getQuantidade() + cookieCExistente.getQuantidade());
						} else {
							cookieC.setQuantidade(cookieC.getQuantidade());
						}
						
					}
					
					//Adiciona o cookie na resposta
					cookieC.criarNomeCookie();
					String nomeCookie = cookieC.getNomeCookie();
					Cookie cookie = new Cookie(nomeCookie, "1");
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
			case "removerProdutoById": {
				try {
						String idProduto = request.getParameter("idProduto"); 
						Cookie cookies[] = request.getCookies();
						CookieCreator tempCreator = new CookieCreator();
						
						
						//Pega o cookie pelo ID e remove
						 for (Cookie cookie : cookies ) {
							 tempCreator.pegarValoresPeloNomeCookie(cookie.getName());
							 if (tempCreator.getId().toString().equals(idProduto)) {
								 cookie.setMaxAge(0);
								 response.addCookie(cookie);
							 }
						 }
						 
					
						 break;
				} catch (Exception e) {
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
		
		String action = request.getParameter("action");
		StatusMethod st = null;
		
		
		
		if (verificarAction(action) && action.equals("finalizar_compra")) {
			
			if (request.getSession().getAttribute("idUsuario") == null) {
				st = new StatusMethod(STATUS.ERROR, "Logue-se para realizar a compra", "Para realizar a compra, é necessário cadastrar ou logar na loja!");
			} else {
				ProdutoService produtoService = new ProdutoService();
				Cookie cookies[] = request.getCookies();
				CookieCreator cookieDesfragmentado = new CookieCreator();
				List<ProdutoModel> produtos = new ArrayList<>();
				
				final Double[] soma = new Double[1];
				soma[0] = 0.00;
				//Transforma os cookies do carrinho em produtos e adiciona em uma lista.
				Arrays.stream(cookies)
					.filter(
						cookie -> cookie.getName().split("_")[0].equals("carrinho") )
					.forEach(cookie -> {
					cookieDesfragmentado.pegarValoresPeloNomeCookie(cookie.getName());
					
					if (cookieDesfragmentado.getTipo().equals("carrinho")) {
						ProdutoModel produto = new ProdutoModel(cookieDesfragmentado.getId(), cookieDesfragmentado.getQuantidade());
						
						ProdutoModel produtoTemp = produtoService.pegarDadosProduto(produto.getIdProduto());
						produto.setPreco(produtoTemp.getPreco());
						produtos.add(produto);
						soma[0] += produtoTemp.getPreco() * produto.getQuantidade();
					}
				});
				
				Integer idUsuario = Integer.parseInt(request.getSession().getAttribute("idUsuario").toString());
				Integer idVenda = produtoService.inserirVendaTotal(soma[0], idUsuario);
				produtos.forEach(produto -> {
					StatusMethod stTemp = produtoService.inserirVendaProduto(produto, idVenda);
					if (stTemp.getStatus() == STATUS.SUCCESS) {
						produtoService.retirarQuantidadeProduto(produto.getIdProduto(), produto.getQuantidade());
					}
				});

				Arrays.stream(cookies)
					.filter(
						cookie -> cookie.getName().split("_")[0].equals("carrinho") )
					.forEach(cookie -> {
							cookie.setMaxAge(0);
							cookie.setPath("/LojaMusical/carrinho");
							response.addCookie(cookie);
					});
				st = new StatusMethod(STATUS.SUCCESS, "Compra efetuada com sucesso", "Sua compra foi realizada. Confira o seu email para mais informações");
			}
		}
		
		if (st != null) {
			request.setAttribute("status", st.status.toString().toLowerCase());
			request.setAttribute("statusTitulo", st.getTitulo());
			request.setAttribute("statusTexto", st.getMensagem());
		}
		doGet(request, response);
	}
	
	public boolean verificarAction(String action) {
		if (action != null && !action.equals("")) {
			return true;
		}
		return false;
	}

}
