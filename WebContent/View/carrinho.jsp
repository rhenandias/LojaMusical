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
	$(document).ready(function() { 
		// Aqui o objeto de carrinhos será montado
		const produtos = [
			{
				"idProduto": 0,
				"nome": "Violão de Estudos",
				"marca": "Tagima",
				"preco": 259.99,
				"quantidade": 2,
				"imagem": "produto_0.png",
			},
			{
				"idProduto": 1,
				"nome": "Guitarra Elétrica",
				"marca": "Casio",
				"preco": 155,
				"quantidade": 3,
				"imagem": "produto_1.png",
			},
			{
				"idProduto": 2,
				"nome": "Bateria Bateria Bateria",
				"marca": "Yamaha",
				"preco": 155,
				"quantidade": 1,
				"imagem": "produto_2.png",
			}
		];
		
		// Cria o card e a tabela para receber o carrinho
		const cardCarrinho = `
			<div class="card">
			  <div class="card-body">
			  
			  	<table class="table table-striped table-hover align-middle table-sm">
				  	<thead>
					    <tr>
					      <th scope="col">Produto</th>
					      <th scope="col">Preço Unitário</th>
					      <th scope="col">Quantidade</th>
					      <th scope="col">Preço Total</th>
					      <th scope="col" class="text-center">Excluir</th>
					    </tr>
				  </thead>
				  <tbody id="tabela-carrinho">
				    
			      </tbody>	
				</table>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<p class="text-muted">Total:</p> 
					<h4>R$999,99</h4>
				</div>
				
				</div>
			  </div>
			</div>
		`;
		
		$("#carrinho").append(cardCarrinho);
		
		// Cria cada uma das linhas para os produtos no carrinho
		for(const produto of produtos){
			const fotoUrl = "${pageContext.request.contextPath}/FotosProdutos/" + produto.imagem;
			
			let linhaTabela = `
				<tr>
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		<img class="border" src=\${fotoUrl} alt="Imagem do Produto" width="100px">
			      		<p class="mx-4">\${produto.nome}</p>
			      	</div>
			      </td>
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		<p>R$\${produto.preco}</p>
		      		</div>
		      	  </td>
			      <td>
				      <div class="d-flex flex-row">
						<i class="bi bi-dash-lg"></i>
						<form>
							<div class="row">
								<div class="col">
								   <input type="number" min="1" class="form-control col-1" placeholder=\${produto.quantidade}>
								</div>
							</div>
						</form>
						<i class="bi bi-plus-lg"></i>
						</div>
		      	  </td>
		      	  <td>
		      	  	R$\${produto.preco * produto.quantidade}
		      	  </td>
		      	  <td>
		      	  <div class="text-center">
		      			<i class="bi bi-trash icone-excluir" style="color: red"></i>
		      	  </div>
		      	  </td>
			    </tr>
			`;
			
			// Insere a linha criada na tabela
			$("#tabela-carrinho").append(linhaTabela);
			
		}
				
	});

</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex">
		<div id="card-produto" class="container-fluid d-flex flex-column justify-content-center p-4">
			<div class="container-fluid">
				<h5>Carrinho de Compras</h5>
				<h6 class="text-muted">Clique em finalizar compra para efetuar o seu pedido</h6>
			</div>
			<div id="carrinho" class="container-fluid my-3">
			
			</div>
			<div class="container-fluid">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-outline-secondary" type="button">Continuar comprando</button>
			  <button class="btn btn-success" type="button">
			  	<i class="bi bi-check" style="font-size: 1rem;"></i> 
			  	Finalizar Compra
			  	</button>
			</div>
			</div>
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>