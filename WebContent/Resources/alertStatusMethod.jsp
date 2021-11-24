<%
	String status = "";
	String statusTitulo = "";
	String statusTexto = "";
	try {
		status = request.getAttribute("status").toString().replaceAll("\\P{Print}","");
		statusTitulo = request.getAttribute("statusTitulo").toString();
		statusTexto = request.getAttribute("statusTexto").toString();
	} catch(Exception e) {
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