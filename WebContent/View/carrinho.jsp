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
<script type="text/javascript" src="${pageContext.request.contextPath}/Javascript/produto.js"></script>
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
					      <th scope="col">Produto</th>
					      <th scope="col">Preço Unitário</th>
					      <th scope="col" class="text-center">Quantidade</th>
					      <th scope="col">Preço Total</th>
					      <th scope="col" class="text-center">Excluir</th>
					    </tr>
				  </thead>
				  <tbody id="tabela-carrinho">
				    
			      </tbody>	
				</table>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<p class="text-muted">Total:</p> 
					<h4 id="totalCarrinho">Calculando...</h4>
				</div>
				
				</div>
			  </div>
			</div>
		`;
		
		$("#carrinho").append(cardCarrinho);
		
		
		//Pega todos os cookies e coloca dentro de um Object[]
		const cookies = document.cookie.split(';').reduce((cookies, cookie) => {
			  const [ name, value ] = cookie.split('=').map(c => c.trim());
			  cookies[name] = value;
			  return cookies;
			}, {});

		
		// Percore o const cookies, pega o id e a quantidade de cada um, e faz a requisição ajax
		for (const c of Object.entries(cookies)) {
			  const arrayCookie = c[0].split("_");
				if (arrayCookie[0] == "carrinho") {
			    	const id = arrayCookie[1].split("-")[1];
					const qtd = arrayCookie[2].split("-")[1];
					
					$.ajax({
						type: "GET",
						url: "${pageContext.request.contextPath}/produto/buscar",
						data: {
							id: id
						},
						success: function(response) {
							let produto = JSON.parse(response);
							produto.cookieName = c[0];
							produto.quantidade = qtd;
							//Soma o valor e corrige o float()
							let valorAtual = produto.quantidade * produto.preco;
							somaValor = somaValor + valorAtual;
							
							let linhaProdutoTabela = criarCardCarrinhoProduto(produto)
							$("#tabela-carrinho").append(linhaProdutoTabela);
						}
						
					});
			  }
		};
		
		
		
		// Cria cada uma das linhas para os produtos no carrinho
		for(const i = 0; i < produtos.length; i++){
			const produto = produtos[i];
			
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
				      <div class="d-flex flex-column justify-content-center align-items-center">
						<form>
							<div class="row">
								<!-- 
								<div class="col-1">
									<i class="bi bi-dash-lg"></i>
								</div>
								-->
								<div class"col-1">
								   <input type="number" min="1" class="form-control" placeholder=\${produto.quantidade}>
								</div>
								<!--								
								<div class="col-1">
									<i class="bi bi-plus-lg"></i>
								</div>
								-->
							</div>
						</form>
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
			
			
			
			intervalId();
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
	<script>
		
	</script>
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>