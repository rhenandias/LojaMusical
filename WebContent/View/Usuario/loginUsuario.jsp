<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical - Login</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<style>
	.fundo {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.cadastrar-card {
		display: flex;
		border-radius: 20px;
		background-color: white;
	}
	
	.center-vertically {
		/* position:  absolute; */
		/* top: 50%; */
		/* transform: translateY(-50%); */
		margin-top: 30px;
	}
	
	.imagem-croped {
		width: 300px;
	    height: 420px;
	    object-fit: cover;
	    right: 20px;
	}
	
	img {
		border-radius: 5px;
	}
	
	.div-formulario {
		padding: 25px;
	}
	
	.form-label {
		font-size: 1rem;
	}
	
	.form-line {
		margin: 2px 0px;
	}
	
	.form {
		margin: 0px;
		padding: 0px;
	}
	
	.link-personalizado {
		text-decoration: none;
	}
	
	.link-personalizado:hover {
		text-decoration: underline;
	}
	
</style>
</head>
<body>
	<%@include file="/Resources/navbarSimples.jsp" %>
	
	<%@include file="/Resources/alertStatusMethod.jsp" %>
	
	<div class="container-fluid fundo">
		<div class="card center-vertically">
 
			<div class="card-body cadastrar-card">
				<div>
					<img class="imagem-croped" src="${pageContext.request.contextPath}/Resources/Images/instrumentos.png" alt="Instrumentos">
				</div>
				<div class="div-formulario">
				
					<div class="mx-2">
						<div class="mt-2">
							<h5 class="card-title">Realizar Login</h5>
						</div>
						<div class="mt-3">
							<h6 class="card-subtitle text-muted">Acessar sua conta na Loja Musical</h6>
						</div>
					</div>
					
					<form class="form" method="POST" >
						<input class="form-control" name="action" value="login" hidden>
						<div class="row g-3 form-line">
						  	<div class="col-sm">
					  			<label class="form-label">Email</label>
						    	<input type="email" name="email" class="form-control" placeholder="Email">
						  	</div>
						</div>
						
						<div class="row g-3 form-line">
						  	<div class="col-sm">
					  			<label class="form-label">Senha</label>
						    	<input type="password" name="senha" class="form-control" placeholder="Senha">
						  	</div>
						</div>
						
						<div class="mx-2">
							<div class="row g-3 mt-3">
								<div class="d-grid gap-3">
		  							<button class="btn btn-primary" name="login" type="submit">Login</button>
								</div>
							</div>
						</div>
						
						<div class="mx-2 mt-2 d-flex flex-column ">
							<a href="#" class="link-primary link-personalizado mt-1">Esqueci minha senha</a>
							<a href="cadastrar" class="link-primary link-personalizado mt-1">Criar conta de usuário</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>