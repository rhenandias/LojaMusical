<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultados de Busca</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
</head>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	<h1>Página de resultado de Buscas</h1>
	
	<div class="mb-3">
  		<label for="exampleFormControlInput1" class="form-label">Email address</label>
  		<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
	</div>

	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>