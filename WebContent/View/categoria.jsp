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
			const categoriaUrl = "";
			
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
						
						
						$("#card-produto").append(cardProduto);
					} else {
						// Categoria não foi encontrada, exibir tela de erro
						let erro = `
							<div class="container-fluid d-flex justify-content-center">
								<div class="alert alert-primary" role="alert">
									Não foi encontrado nenhuma categoria para o ID informado.
								</div>
							</div>
						`;
						
						$("#card-produto").append(erro);
					}
				}
			});
		}
		
	
		
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex justify-content-center">
		<div id="card-produto" class="container-fluid d-flex flex-column justify-content-center p-4">
		
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>