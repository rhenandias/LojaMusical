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
</style>
<script type="text/javascript">
	$(document).ready(function() { 
		// Aqui o objeto de produto irá retornar do banco de dados
		const produto = {
			"idProduto": 0,
			"nome": "Violão de Estudos",
			"marca": "Tagima",
			"preco": 259.99,
			"quantidade": 1,
			"imagem": "produto_0.png",
			"descricao": `
				Violão de estudos, ideal para iniciantes na prática de um instrumento de corda.
				<br/><br/>
				Possui cordas de nylon, que facilita o aprendizado inicial, além de possui uma empunhadura confortável.
				<br/><br/>
				Corpo do violão em madeira de mogno, resistente a quedas e impactos, além de proporcionar uma excelente acústica.
				`
		
		}
		
		const fotoUrl = "${pageContext.request.contextPath}/FotosProdutos/" + produto.imagem;
		
		const cardProduto = `
			<div class="card">
		  		<div class="card-body d-flex flex-row">
			    	<div >
			    		<img class="border" src=\${fotoUrl} alt="Imagem do Produto" width="650px">
					</div>
			    	<div class="container-fluid produto-info p-4">
			    		<div class="text-center">		    		
					    	<h5 class="card-title">\${produto.nome}</h5>
			    			<h6 class="card-subtitle mt-2 text-muted">
			    				<span class="">Marca: \${produto.marca}</span>
			    			</h6>
			    		</div>
			    		
			    		<div class="container-fluid d-flex flex-row align-items-center mt-3">
		    				<div class="divisor-horizontal"></div>
		    				<h6><span class="badge rounded-pill bg-secondary">Código: \${produto.idProduto}</span></h6>
		    				<div class="divisor-horizontal"></div>
	    				</div>
			    		
			    		<div class="container-fluid p-2 m-2">
			    			<p style="font-size: 0.9rem">\${produto.descricao}
			    		</div>
				    	
			    		<div class="container-fluid d-flex flex-row align-items-center">
			    			<div class="divisor-horizontal"></div>
							<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
							<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
							<i class="bi bi-music-note" style="font-size: 1rem;" ></i>
							<i class="bi bi-music-note-beamed" style="font-size: 1rem;" ></i>
			    			<div class="divisor-horizontal"></div>
		    			</div>
				    	
			    		<div class="container-fluid p-2">
			    			<div class="container-fluid text-center my-3">
			    				<h3 class="card-title"><span class="badge bg-primary">R$\${produto.preco}</span></h3>
		    				</div>
		    		
		    				\${produto.quantidade > 0 ?
    						`
				    			<div class="mb-3 text-center d-flex flex-row justify-content-center">
				    				<h6 class="text-muted mx-2">Garanta já o seu!</h6>
				    			</div>
				    		`
							: 
						    `
						   		 <div class="mb-3 text-center d-flex flex-row justify-content-center">
				    				<h6 class="text-muted mx-2">Ops, não temos unidades deste item disponíveis no momento.</h6>
				    			</div>
						    `
		    				}
				    			
			    			
				    		<form >
					    		<!-- Verifica se o produto possui quantidade disponível em estoque -->
					    		\${produto.quantidade > 0 ? 
					    		`
						    		<!-- Formulário de produto disponível -->
					    		<div >
							    	<div class="row ">
							    	  <div class="col-3">
							    	    <input type="number" min="1"  class="form-control" placeholder="1" aria-label="First name">
							    	  </div>
							    	  <div class="col">
							    	  	<div class="d-grid gap-2 mx-auto">
								    	  <button class="btn btn-success" type="button">
								    	  	<i class="bi bi-cart" style="font-size: 1rem;" ></i>
											Comprar
								    	  </button>
								    	</div>
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
			    		
			    		<div class="container-fluid d-flex flex-row align-items-center mt-4">
			    			<div class="divisor-horizontal"></div>
		    			</div>
			    	</div>
		  		</div>
			</div>
		`;
		
		$("#card-produto").append(cardProduto);
		
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div class="container-fluid d-flex">
		<div id="card-produto" class="container-fluid d-flex flex-column justify-content-center p-4">
		
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>