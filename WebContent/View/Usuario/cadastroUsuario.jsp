<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical - Cadastrar</title>
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
	
	<%
	String status = "";
	String statusTitulo = "";
	String statusTexto = "";
	try {
		status = request.getAttribute("status").toString();
		statusTitulo = request.getAttribute("statusTitulo").toString();
		statusTexto = request.getAttribute("statusTexto").toString();
	} catch(Exception e) {
		status = "";
		statusTitulo = "";
		statusTexto = "";
	}
	if (status == null) {
		status = "";
	}
	String nameAlert = null;
	switch (status) {
		case "error":
			nameAlert = "danger";
			break;
		case "":
			nameAlert = null;
			break;
		case "success":
			nameAlert = "success";
			break;
	}
	%>
	<% if (nameAlert != null) { %>
	<div class="container alert alert-<%out.write(nameAlert); %>" role="alert">
		  <h4 class="alert-heading"><%out.write(statusTitulo);%></h4>
		  	<p></p>
		  <hr>
		  <p class="mb-0"><%out.write(statusTexto); %></p>
	</div>
	
	<% } %>
	
		
	<div class="container-fluid fundo">
	
		
		<div class="card center-vertically">
 
			<div class="card-body cadastrar-card">
				<div>
					<img class="imagem-croped" src="${pageContext.request.contextPath}/Resources/Images/instrumentos.png" alt="Instrumentos">
				</div>
				<div class="div-formulario">
				
					<div class="mx-2">
						<div class="mt-2">
							<h5 class="card-title">Criar Nova Conta de Usuário</h5>
						</div>
						<div class="mt-3">
							<h6 class="card-subtitle text-muted">Crie uma nova conta para realizar compras na Loja Musical</h6>
						</div>
					</div>
					
					<form class="form" method="POST">
						<input name="action" value="cadastrar" hidden>
						<div class="row g-3 form-line">
						  	<div class="col-sm">
					  			<label class="form-label">Email</label>
						    	<input type="email" name="email" class="form-control form-control-sm" placeholder="Email">
						  	</div>
						  	<div class="col-sm">
					  			<label class="form-label">Senha</label>
						    	<input type="password" name="senha" class="form-control form-control-sm" placeholder="Senha">
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">Nome Completo</label>
						    	<input type="text" name="nome_completo" class="form-control form-control-sm" placeholder="Nome Completo">
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">CPF</label>
						    	<input type="text" name="cpf" class="form-control form-control-sm" placeholder="CPF">
						  	</div>
						  	<div class="col-sm">
					  			<label class="form-label">Telefone</label>
						    	<input type="text" name="telefone" class="form-control form-control-sm" placeholder="Telefone">
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">Endereço</label>
						    	<input type="text" name="endereco" class="form-control form-control-sm" placeholder="Endereço">
						  	</div>
						  	<div class="col-sm-4">
					  			<label class="form-label">Número</label>
						    	<input type="text" name="numero" class="form-control form-control-sm" placeholder="Número">
						  	</div>
						</div>
						<div class="row g-3 form-line">
					  		<div class="col-sm">
					  			<label class="form-label">Bairro</label>
						    	<input type="text" name="bairro" class="form-control form-control-sm" placeholder="Bairro">
						  	</div>
						  	<div class="col-sm-4">
					  			<label class="form-label">Cidade</label>
						    	<input type="text" name="cidade" class="form-control form-control-sm" placeholder="Cidade">
						  	</div>
						  	<div class="col-sm-4">
				  				<label class="form-label" for="uf">Estado</label>
								<select class="form-control form-control-sm" id="uf" name="uf" size="1">
									<option value="AC">Acre</option>
									<option value="AL">Alagoas</option>
									<option value="AP">Amapá</option>
									<option value="AM">Amazonas</option>
									<option value="BA">Bahia</option>
									<option value="CE">Ceará</option>
									<option value="DF">Distrito Federal</option>
									<option value="ES">Espírito Santo</option>
									<option value="GO">Goiás</option>
									<option value="MA">Maranhão</option>
									<option value="MT">Mato Grosso</option>
									<option value="MS">Mato Grosso do Sul</option>
									<option value="MG">Minas Gerais</option>
									<option value="PA">Pará</option>
									<option value="PB">Paraíba</option>
									<option value="PR">Paraná</option>
									<option value="PE">Pernambuco</option>
									<option value="PI">Piauí</option>
									<option value="RJ">Rio de Janeiro</option>
									<option value="RN">Rio Grande do Norte</option>
									<option value="RS">Rio Grande do Sul</option>
									<option value="RO">Rondônia</option>
									<option value="RR">Roraima</option>
									<option value="SC">Santa Catarina</option>
									<option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
								</select>
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