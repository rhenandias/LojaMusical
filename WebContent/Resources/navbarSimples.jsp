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
</style>

<!--  A Navbar Simples é utilizada para as telas que não tem o restante das funções na barra -->
<!--  Como por exemplo, a tela de cadastro de novo usuário -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3" style="font-size: 0.9rem">
	<div class="container-fluid">
   	    <a class="navbar-brand" href="#">
      		<img src="${pageContext.request.contextPath}/Resources/Images/logo_navbar_2.png" alt="Logo Site" width="150">
   		</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
    	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	      	
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        		<li class="nav-item">
	        		<div class="d-flex align-items-center">
	          			<i class="bi bi-box-arrow-in-up-right" style="font-size: 1rem; color: white;"></i>
	          			<a class="nav-link active" aria-current="page" href="../home">Voltar para a Loja</a>
	        		</div>
        		</li>
      		</ul>
    	</div>
  	</div>
</nav>