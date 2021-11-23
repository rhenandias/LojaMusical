<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loja Musical - Ativação</title>
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
		status = request.getAttribute("status").toString().replaceAll("\\P{Print}","");
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
	String nameAlert = "";
	switch (status) {
		case "error":
			nameAlert = "danger";
			break;
		case "":
			nameAlert = "";
			break;
		case "success":
			nameAlert = "success";
			break;
		default:
			nameAlert = "primary";
			break;
	}
	%>
	<% %>
	<div class="container alert alert-<%out.write(nameAlert); %>" role="alert">
		  <h4 class="alert-heading"><%out.write(statusTitulo);%></h4>
		  	<p></p>
		  <hr>
		  <p class="mb-0"><%out.write(statusTexto); %></p>
	</div>
	
	<%%>
	
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>