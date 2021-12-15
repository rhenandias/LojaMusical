<%@page import="models.CategoriaModel"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produto</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Javascript/vendas.js"></script>
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
	
	.icone-excluir:hover {
		cursor: pointer; 
	}
</style>
<script type="text/javascript">
	//Aqui o objeto de carrinhos será montado
	var produtos = [];
	var statusAndamento = [];
	
	var somaValor = 0;
	
	var intervalId = window.setInterval(function(){
		$('#totalCarrinho').text("R$ " + somaValor.toFixed(2));
		}, 3000);
	$(document).ready(function() { 
		
		
		// Cria o card e a tabela para receber o carrinho
		const cardCarrinho = `
			<div class="card">
			  <div class="card-body">
			  
			  	<table class="table table-striped table-hover align-middle table-sm">
				  	<thead>
					    <tr>
					      <th scope="col">ID Venda</th>
					      <th scope="col">Status</th>
					      <th scope="col">Valor</th>
					      <th scope="col" class="text-center">Data</th>
					    </tr>
				  </thead>
				  <tbody id="tabela-carrinho">
				    
			      </tbody>	
				</table>
				
				</div>
			  </div>
			</div>
		`;
		
		$("#carrinho").append(cardCarrinho);
		
		let statusAndamento = [];
		
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/statusAndamento/listar",
			success: function(response) {
				statusAndamento = JSON.parse(response);
				
				ajaxListarPedidos(statusAndamento);
			}
		});
		
		function ajaxListarPedidos(statusAndamento) {
			$.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath}/vendas/listar",
				success: function(response) {
					jsonPedido = JSON.parse(response);
					jsonPedido.forEach(pedido => {
						let linhaVenda = criarCardVenda(pedido, statusAndamento);
						$("#tabela-carrinho").append(linhaVenda);
						
					})
				}
			})
		}
				
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<%@include file="/Resources/alertStatusMethod.jsp" %>
	
	<div class="container-fluid d-flex">
		<div id="card-produto" class="container-fluid d-flex flex-column justify-content-center p-4">
			<div class="container-fluid">
				<h5>Lista de vendas</h5>
				<h6 class="text-muted">Aqui você verá as vendas geradas pela compra dos usuarios. É possível alterar os status também</h6>
			</div>
			<div id="carrinho" class="container-fluid my-3">
			
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>