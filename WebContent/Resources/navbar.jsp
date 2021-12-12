<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">

<style>
	.vertical-divider {
		height: 40px;
		width: 1px;
		background-color: lightgrey;
		margin: 0 20px;
	}
		
 	#buscar-produtos-form {
 		width: 380px !important;
	}
	
	.classe-submit:hover {
		cursor: pointer
	}
</style>

<script>
	// Submit do Formd e Busca
	$().ready(function (){
		$(".classe-submit").click(function () {
			$("#form-busca").submit();	
		});
	})
	
	// Preenchimento dinamico do Dropdown de categorias
	$().ready(function (){
		
		const categoriaUrl = "${pageContext.request.contextPath}" + "/categoria/listar";

		// Realiza listagem das categorias existentes
		$.ajax({
			type: "GET",
			url: categoriaUrl,
			contentType: "application/json; charset=utf-8",
			success: function(response){
				const categorias = JSON.parse(response);
				
				// Montar o dropdown
				for(const idx in categorias){
					const categoria = categorias[idx];
					
					// Monta URL alvo da categoria
					let categoriaUrl = "${pageContext.request.contextPath}/categoria/info?id=" + categoria.idCategoria;
					
					// Monta list item
					let dropdownLi = `
						<li><a class="dropdown-item" href=\${categoriaUrl} >\${categoria.nome}</a></li>
					`;
					
					// Adiciona list item
					$("#drop-categorias").append(dropdownLi);
					
				}
			}
		});
	})
</script>

<%
	// Definir aqui se o usuário está logado e qual o tipo de usuario
	boolean logado = session.getAttribute("idUsuario") != null ? true : false;
	boolean administrador = false;
	
	if (logado) {
		String idNivelUsuario = session.getAttribute("idNivelUsuario").toString();
		if ( idNivelUsuario != null) {
			administrador = Integer.parseInt(idNivelUsuario) == 2 ? true : false;
		}
	}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3 sticky-top" style="font-size: 0.9rem">
	<div class="container-fluid">
   	    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
      		<img src="${pageContext.request.contextPath}/Resources/Images/logo_navbar_2.png" alt="Logo Site" width="150">
   		</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
    	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	      	
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        		<li class="nav-item">
          			<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home">Início</a>
        		</li>
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            			Categorias
          			</a>
		          	<ul id="drop-categorias" class="dropdown-menu" aria-labelledby="navbarDropdown">
		          	</ul>
        		</li>
      		</ul>
      		
      		<div class="navbar-nav me-auto mb-2 mb-lg-0">
			    <form id="form-busca" method="GET" action="${pageContext.request.contextPath}/busca/resultados">
			    	<div class="input-group">
	       				<input class="form-control-sm" type="text" placeholder="Buscar Produtos" id="buscar-produtos-form" name="pesquisa">
	       				<div class="input-group-text classe-submit" >
	       					<i class="bi bi-search" style="font-size: 1rem; color: black;"></i>
	       				</div>
			    	</div>
	   			</form>
      		</div>
   			
      		<ul class="navbar-nav mb-2 mb-lg-0">
				<li>
			 		<div class="vertical-divider"></div>
			 	</li>
			 	
      			<!-- Usuário Não logado, Exibir opções de Cadastro e Login -->
				<% if(!logado) { %>
					<li class="nav-item">
						<div class="d-flex align-items-center">
					    	<i class="bi bi-person" style="font-size: 2rem; color: white;"></i>
							<div style="font-size: 0.8rem">
								<a class="nav-link" style="line-height: 0.3rem" href="${pageContext.request.contextPath}/usuario/login">Login</a>
								<a class="nav-link" style="line-height: 0.3rem" href="${pageContext.request.contextPath}/usuario/cadastrar">Cadastrar</a>
							</div>
						</div>
					</li>	
				<% } %>
				
				<!-- Usuário (cliente) já está logado, exibir painel do usuário -->
				<% if(logado && !administrador) { %>
					<li class="nav-item">
						<div class="d-flex align-items-center">
					    	<i class="bi bi-box" style="font-size: 2rem; color: white;"></i>
							<div style="font-size: 0.8rem">
								<a class="nav-link" style="line-height: 0.3rem" href="${pageContext.request.contextPath}/meusPedidos">Meus Pedidos</a>
								<a class="nav-link" style="line-height: 0.3rem" href="${pageContext.request.contextPath}/usuario/sair">Sair</a>
							</div>
						</div>
					</li>	
				<% } %>
				
				<!-- Usuário (administrador) já está logado, exibir painel do administrador -->
				<% if(logado && administrador) { %>
					<li class="nav-item">
						<div class="d-flex align-items-center">
					    	<i class="bi bi-gear" style="font-size: 2rem; color: white;"></i>
							<div style="font-size: 0.8rem">
								<a class="nav-link" style="line-height: 0.3rem" href="#">Painel da Loja</a>
								<a class="nav-link" style="line-height: 0.3rem" href="${pageContext.request.contextPath}/usuario/sair">Sair</a>
							</div>
						</div>
					</li>	
				<% } %>
				
				<!-- Carrinho aparece para todos os tipos de usuários -->
				<li>
					<div class="vertical-divider"></div>
				</li>
				<li class="nav-item">
					<div class="d-flex align-items-center">
			   			<i class="bi bi-cart" style="font-size: 2rem; color: white;"></i>
			 			<a class="nav-link" href="${pageContext.request.contextPath}/carrinho">Carrinho</a>
			 		</div>
		  		</li>
		  		
			</ul> 
    	</div>
  	</div>
</nav>