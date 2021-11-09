<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//String categoria = request.getParameter("categoria");
		// Busca do Model, os instrumentos na categoria = "categoria"
		//response.getWriter().write(categoria);
		
		String[] resultados = { "Produto 1", "Produto 2" } ;
	%>
	<h1>Categoria ...</h1>
	
	<div>
		<div>
			<% for(String item : resultados ) {%>
				<div>
					<div>
					<% response.getWriter().write(item + "<br>"); %>
					</div>
				</div>
			<% } %>
		</div>
	</div>
</body>
</html>