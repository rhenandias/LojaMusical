<%@page import="models.CategoriaModel"%>
<%@page import="com.google.gson.JsonObject"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<style>
	.divisor-horizontal {
		display: flex;
		flex-grow: 1;
		height: 1px;
		background-color: lightgrey;
		margin: 0px 20px;
		padding: 0px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// Lista as categorias existentes
		$.get("categoria/listar", function(responseCategorias){
		
			const categorias = JSON.parse(responseCategorias);
			
			// Percorre cada uma das categorias e lista alguns produtos de cada uma delas
			for(const i in categorias){
				// Dados da categoria atual
				const nomeCategoria = categorias[parseInt(i).toString()]["nome"];
				const idCategoria = categorias[parseInt(i).toString()]["idCategoria"];
				
				// Adquire os produtos existentes
				$.ajax({
					type: "GET",
					url: "produto/listar",
					data: {
						idCategoria: idCategoria,
						limit: 4
					},
					success: function(responseProdutos){
						// Executa parse na resposta para JSON
						const produtosJson = JSON.parse(responseProdutos);
						
						// Transformar a resposa em um iterable
						let produtos = [];
						
						for(const idx in produtosJson){
							produtos.push(produtosJson[idx]);
						}
												
						const idLinha = `categoria-div-\${idCategoria}`;
						
						// Constroi a linha da categoria
						const linhaCategoria = `
							<div class="container-fluid d-flex flex-column my-2">
								<div class="container-fluid justify-content-center d-flex flex-row align-items-center my-2 p-0">
									<div class="divisor-horizontal"></div>
									<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
									<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
									<div class="mx-3">
										<h3>\${nomeCategoria}</h3>
									</div>
									<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
									<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
									<div class="divisor-horizontal"></div>
								</div>
								<div id=\${idLinha} class="container-fluid d-flex flex-row justify-content-between my-2">
								
								</div>
								
							</div>
						`;
						
						// Adiciona a linha construída na página
						$("#categorias").append(linhaCategoria);
						
						// Cria os cards de produtos
						for(const produto of produtos){
							const fotoUrl = "${pageContext.request.contextPath}/FotosProdutos/" + produto.imagem;
							
							let cardProduto = `
								<div class="card" style="width: 18rem;">
								  <img src=\${fotoUrl} class="card-img-top" alt="Imagem do Produto" width="100px">
								  <div class="card-body">
								    <div>
								    	<h5 class="card-title">\${produto.nome}</h5>
								    	<h6 class="card-subtitle mb-2 text-muted">\${produto.marca}</h6>
								    	<div class="my-2">
									    	<h5 class="card-title">R$\${produto.preco}</h5>
								    	</div>
								    	<form class="mt-3">
								    		<!-- Verifica se o produto possui quantidade disponível em estoque -->
								    		\${produto.quantidade > 0 ? 
								    		`
									    		<!-- Formulário de produto disponível -->
										    	<div class="row">
										    	  <div class="col">
										    	    <input type="number" min="1"  class="form-control" placeholder="1" aria-label="First name">
										    	  </div>
										    	  <div class="col">
										    	  	<div class="d-grid gap-2">
											    	  <button class="btn btn-success" type="button">
											    	  	<i class="bi bi-cart" style="font-size: 1rem;" ></i>
											    	  	<i class="bi bi-plus" style="font-size: 1rem;" ></i>
											    	  </button>
											    	</div>
										    	  </div>
										    	</div>
									    	`
									    	:
									    	`
									    		<!-- Formulário de produto disponível -->
									    		<div class="row">
										    	  <div class="col">
										    	  	<div class="d-grid gap-2">
											    	  <button class="btn btn-secondary" type="button" disabled>
											    	  	Indisponível
											    	  </button>
											    	</div>
										    	  </div>
										    	</div>
									    	`
								    		}
								    	</form>
								    </div>
								  </div>
								</div>
							`;
			
							// Adiciona o card a arvore da pagina
							$("#" + idLinha).append(cardProduto);
						}
					}
				});
				
			}
		});
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex">
		<div id="categorias" class="container-fluid d-flex flex-column">
		
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>