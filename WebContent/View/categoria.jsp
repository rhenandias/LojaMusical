<%@page import="models.CategoriaModel"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categoria</title>
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
		// Adquire os parâmetros da URL
		let parametrosPesquisa = new URLSearchParams(window.location.search);
		
		// Verifica se o parâmetro "id" existe, por ele será passado o alvo da busca
		if(parametrosPesquisa.has('id')){
			let id = parametrosPesquisa.get('id');
			
			// Realiza busca pela categoria
			const categoriaUrl = "${pageContext.request.contextPath}" + "/categoria/listar";
			
			$.ajax({
				type: "GET",
				url: categoriaUrl,
				contentType: "application/json; charset=utf-8",
				data: {
					id: id
				},
				success: function(response){
					const categoria = JSON.parse(response);
					
					// Verifica se foi retornado algum produto
					if(!categoria.hasOwnProperty("erro")){
						// Produto do ID especificado foi encontrado, iniciar construção da tela de exibição
				
						// Acrescenta quebra de linha no texto de descriçao
						if(categoria.descricao){					
							categoria.descricao = categoria.descricao.replace(/\n/g, '<br/>');
						} else {
							categoria.descricao = "Nenhuma descrição disponível";
						}
						
						// Monta cabeçalho da página de categoria
						const categoriaTitulo = `
							<div class="container-fluid d-flex flex-column my-2">
								<div class="container-fluid justify-content-center d-flex flex-row align-items-center my-2 p-0">
									<div class="divisor-horizontal"></div>
									<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
									<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
									<div class="mx-3">
										<h3>\${categoria.nome}</h3>
									</div>
									<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
									<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
									<div class="divisor-horizontal"></div>
								</div>
								<div>
									<p class="text-center">\${categoria.descricao}</p>
								</div>
							</div>
						`;
						
						
						$("#pagina-categoria").append(categoriaTitulo);
						
						// Busca por produtos dessa categoria para preencher a paǵina
						const produtosUrl = "${pageContext.request.contextPath}" + "/produto/listar";
						
						$.ajax({
							type: "GET",
							url: "produto/listar",
							data: {
								idCategoria: idCategoria
							},
							success: function(responseProdutos){
								
							}
						});
					} else {
						// Categoria não foi encontrada, exibir tela de erro
						let erro = `
							<div class="container-fluid d-flex justify-content-center">
								<div class="alert alert-primary" role="alert">
									Não foi encontrado nenhuma categoria para o ID informado.
								</div>
							</div>
						`;
						
						$("#pagina-categoria").append(erro);
					}
				}
			});
		}
		
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex justify-content-center">
		<div id="pagina-categoria" class="container-fluid d-flex flex-column justify-content-center p-4">
		
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>