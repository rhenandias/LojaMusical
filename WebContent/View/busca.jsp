<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultados de Busca</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
</head>
<script type="text/javascript" charset="UTF-8">
	$(document).ready(function() {
		// Adquire os parâmetros da URL
		let parametrosPesquisa = new URLSearchParams(window.location.search);
		
		// Verifica se o parâmetro "pesquisa" existe, por ele será passado o alvo da busca
		if(parametrosPesquisa.has('pesquisa')){
			let pesquisa = parametrosPesquisa.get('pesquisa')
			
			// Adiciona título do resultado da página de buscas
			$("#resultados-titulo").html(`
				<h3>Resultados da busca para: <i>\${pesquisa}</i></h3>		
			`);
			
			// Adquire os produtos existentes
			$.ajax({
				type: "GET",
				url: "busca/buscar",
				contentType: "application/json; charset=utf-8",
				data: {
					pesquisa: pesquisa
				},
				success: function(response){ 
					const resultados = JSON.parse(response);
					
					// Percorre cada um dos produtos que retornaram da busca
					for(const idx in resultados){
						// Objeto que representa um produto do resultado de busca
						let produto = resultados[idx];
						
						// URL da foto do produto
						const fotoUrl = "${pageContext.request.contextPath}/FotosProdutos/" + produto.imagem;
						const produtoUrl = "${pageContext.request.contextPath}/produto/info?id=" + produto.idProduto;
						
						// Construir card de produto
						
						console.log("Testando:", produto.nome);
						
						let cardProduto = `
							<div class="card m-4" style="width: 18rem;">
							  <img src=\${fotoUrl} class="card-img-top" alt="Imagem do Produto" width="100px">
							  <div class="card-body">
						  	  <a href=\${produtoUrl} class="stretched-link"></a>
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
						
						$("#resultados").append(cardProduto);
					}
				}
			});
		}
	});
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<div>
		<div class="container-fluid" id="resultados-titulo">
			
		</div>
	</div>
	
	<div class="container-fluid d-flex">
		<div id="resultados" class="container-fluid d-flex flex-row">
		
		</div>
	</div>

	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>