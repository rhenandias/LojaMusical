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
<script type="text/javascript" src="${pageContext.request.contextPath}/Javascript/produto.js"></script>
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
										
						// Realiza montagem do card de produto através de componentização
						const cardProduto = criarCardProduto(produto);
						
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