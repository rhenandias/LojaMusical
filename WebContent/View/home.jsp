<%@page import="models.CategoriaModel"%>
<%@page import="com.google.gson.JsonObject"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<style>
	.titulo-divisor {
		width: 50%;
		height: 2px;
		background-color: grey;
	}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$.get("categoria/listar", function(responseText){
		
			const resposta = JSON.parse(responseText);
			
			for(const i in resposta){
				const nomeCategoria = resposta[parseInt(i).toString()]["nome"];
				const idCategoria = resposta[parseInt(i).toString()]["idCategoria"];
				
				const tituloHtml = "<h3>" + nomeCategoria + "</h3";
				
				const html = `
					<div class="container-fluid">
						<h3>\${nomeCategoria}</h3
					<div>
				`
				$("#categorias").append(html);
				
				$.ajax({
					type: "GET",
					url: "produto/listar",
					data: {
						idCategoria: idCategoria,
						limit: 2
					},
					success: function(response){
						console.log("Finalizado");
					}
				});
			}
		});
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex justify-content-center text-center">
		<div id="categorias">
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>