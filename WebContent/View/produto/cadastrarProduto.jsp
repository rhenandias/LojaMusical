<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical - Cadastrar produto</title>
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
		width: 400px;
	    height: 590px;
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
		font-size: 0.9rem;
	}
	
	.form-line {
		margin: 2px 0px;
	}
	
	.form {
		margin: 0px;
		padding: 0px;
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
							<h5 class="card-title">Cadastrar novo produto</h5>
						</div>
						<div class="mt-3">
							<h6 class="card-subtitle text-muted">Cadastre seu produto aqui e comece a vendê-lo</h6>
						</div>
					</div>
					
					<form class="form" method="POST" action="${pageContext.request.contextPath}/produto/cadastrar" enctype="multipart/form-data">
						<input name="action" value="cadastrar" hidden>
						<div class="row g-3 form-line">
						  	<div class="col-sm">
					  			<label class="form-label">Categoria</label>
					  			<select name="idCategoria" class="form-control">
					  				<option value="2" > Acessórios</option>
					  				<option value="3" selected> Cordas</option>
					  				<option value="4"> Percussão</option>
					  				<option value="5"> Sopro</option>
					  				<option value="6"> Instrumento de teclas</option>
					  			</select>
						  	</div>
						  	<div class="col-sm-6">
					  			<label class="form-label">Fornecedor</label>
					  			<select name="idFornecedor" class="form-control">
					  				<option value="1" > Tagima</option>
					  				<option value="2" selected> Yamaha</option>
					  				<option value="3"> Casio</option>
					  			</select>
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">Nome do produto</label>
						    	<input type="text" name="nome" class="form-control form-control-sm" placeholder="Nome do Produto" required>
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">marca</label>
						    	<input type="text" name="marca" class="form-control form-control-sm" placeholder="marca" required>
						  	</div>
						  	<div class="col-sm">
					  			<label class="form-label">Imagem</label>
						    	<input type="file" class="form-control form-control-sm" id="imagem" name="imagem" accept="image/png, image/jpeg">
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">Preço</label>
						    	<input type="number" step="0.01" name="preco" class="form-control form-control-sm" placeholder="Preço" min="0.00" required>
						  	</div>
						  	<div class="col-sm-4">
					  			<label class="form-label">Custo</label>
						    	<input type="number" step="0.01" name="custo" class="form-control form-control-sm" placeholder="Custo" min="0.00" required>
						  	</div>
						  	<div class="col-sm">
					  			<label class="form-label">Quantidade</label>
						    	<input type="number" name="quantidade" class="form-control form-control-sm" placeholder="0" min="0" required>
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		
						  	<div class="col-sm">
					  			<label class="form-label">Descrição</label>
					  			<textarea name="descricao" placeholder="Descreva seu produto aqui" class="form-control form-control-sm" rows="5" cols="100"></textarea>
						  	</div>
						</div>
						<div class="mx-2">
							<div class="row g-3 mt-3">
								<div class="d-grid gap-3">
		  							<button class="btn btn-primary" type="submit">Cadastrar</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>