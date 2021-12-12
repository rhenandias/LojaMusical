<%@page import="models.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="services.PedidoService"%>
<%@page import="models.CategoriaModel"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Produto</title>
<%@include file="/Resources/cssBootstrap.jsp" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Javascript/produto.js"></script>
</head>
<style>
	.divisor-horizontal {
		display: flex;
		flex-grow: 1;
		height: 1px;
		background-color: lightgrey;
		margin: 0px 20px;
		padding: 0px;
	}
	
	.icone-excluir:hover {
		cursor: pointer; 
	}
</style>
<script type="text/javascript">
</script>
<body>
	<%@include file="/Resources/navbar.jsp" %>
	
	<%@include file="/Resources/alertStatusMethod.jsp" %>
	
	<div class="container-fluid d-flex">
		<div id="card-pedido" class="container-fluid d-flex flex-column justify-content-center p-4">
			<div class="container-fluid">
				<h5>Lista de Pedidos</h5>
				<h6 class="text-muted">Aqui você pode ver sua lista de pedidos</h6>
			</div>
			<div id="pedido" class="container-fluid my-3">
				<div class="card">
			  <div class="card-body">
			  
			  	<table class="table table-striped table-hover align-middle table-sm">
				  	<thead>
					    <tr>
					      <th scope="col">Produto</th>
					      <th scope="col">Preço Unitário</th>
					      <th scope="col" class="text-center">Status do pedido</th>
					      <th scope="col" class="text-center">Preço Total</th>
					      
					    </tr>
				  </thead>
				  <tbody id="tabela-pedido">
				    <%
				    String idUsuario = session.getAttribute("idUsuario").toString();
				    PedidoService pedidoService = new PedidoService();
				    List<Pedido> pedidos = pedidoService.listarPedidosPorUsuario(Integer.parseInt(idUsuario));
				    Double valorTotalPedidos = 0.00;
				    for (Pedido pedido : pedidos) {
				    %>
					    <tr>
					      <td>
					      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
					      		<img class="border" src=${pageContext.request.contextPath}/FotosProdutos/<%out.write(pedido.getImagem()); %> alt="Imagem do pedido" width="100px">
					      		<p class="mx-4"><% out.write(pedido.getNome()); %></p>
					      	</div>
					      </td>
					      <td>
					      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
					      		<p>R$ <% out.write(
					      				String.format("%.2f", pedido.getValorIndividual())
					      				); %></p>
				      		</div>
				      	  </td>
					      <td>
						     <div class="d-flex flex-column justify-content-center align-items-center">
								<p> <% out.write(pedido.getNomeStatus()); %> </p>
							 </div>
				      	  </td>
				      	  <td>
				      	  	R$ <%
				      	  		Double valorTotal = pedido.getQuantidade() * pedido.getValorIndividual();
				      	  		valorTotalPedidos += valorTotal;
				      	  		out.write(
				      	  			String.format("%.2f", valorTotal)
				      	  				);
				      	  	%>
				      	  </td>
				      	  <td>
				      	  </td>
					    </tr>
				    <% }
				    %>
			      </tbody>	
				</table>
				
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<p class="text-muted">Total:</p> 
					<h4 id="totalCarrinho"> R$<% 
					
					out.write(
							String.format("%.2f", valorTotalPedidos)
							); %></h4>
				</div>
				
				</div>
			  </div>
			</div>
			<div class="container-fluid">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			</div>
			</div>
		</div>
	</div>
	<script>
	</script>
	<%@include file="/Resources/jsBootstrap.jsp" %>
</body>
</html>