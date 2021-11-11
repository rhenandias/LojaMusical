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

<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3" style="font-size: 0.9rem">
	<div class="container-fluid">
   	    <a class="navbar-brand" href="#">
      		<img src="${pageContext.request.contextPath}/Resources/Images/logo_navbar.png" alt="Logo Site" width="150">
   		</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
    	<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	      	
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        		<li class="nav-item">
          			<a class="nav-link active" aria-current="page" href="#">In�cio</a>
        		</li>
        		<li class="nav-item dropdown">
          			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            			Categorias
          			</a>
		          	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="#">Viol�o</a></li>
			            <li><a class="dropdown-item" href="#">Guitarra</a></li>
			            <li><a class="dropdown-item" href="#">Percurs�o</a></li>
			            <li><a class="dropdown-item" href="#">Acess�rios</a></li>
		          	</ul>
        		</li>
      		</ul>
      		
      		<div class="navbar-nav me-auto mb-2 mb-lg-0">
			    <form>
			    	<div class="input-group">
	       				<input class="form-control-sm" type="text" placeholder="Buscar Produtos" id="buscar-produtos-form">
	       				<div class="input-group-text" >
	       					<i class="bi bi-search" style="font-size: 1rem; color: black;"></i>
	       				</div>
			    	</div>
	   			</form>
      		</div>
   			
      		<ul class="navbar-nav mb-2 mb-lg-0">
				<li>
			 		<div class="vertical-divider"></div>
			 	</li>
				<li class="nav-item">
					<div class="d-flex align-items-center">
				    	<i class="bi bi-person" style="font-size: 2rem; color: white;"></i>
						<div style="font-size: 0.8rem">
							<a class="nav-link" style="line-height: 0.3rem" href="#">Login</a>
							<a class="nav-link" style="line-height: 0.3rem" href="#">Cadastrar</a>
						</div>
					</div>
				</li>	
				<li>
					<div class="vertical-divider"></div>
				</li>
				<li class="nav-item">
					<div class="d-flex align-items-center">
			   			<i class="bi bi-cart" style="font-size: 2rem; color: white;"></i>
			 			<a class="nav-link" href="#">Carrinho</a>
			 		</div>
		  		</li>
			</ul> 
    	</div>
  	</div>
</nav>