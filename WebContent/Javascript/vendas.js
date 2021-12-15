function criarCardVenda(venda, statusAndamento) {

	let linhaVenda =`
				<tr class="my-2">
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		${venda.idVenda}
			      	</div>
			      </td>
				  <td>
				      <div class="d-flex flex-column justify-content-center align-items-center">
						<form id="venda_${venda.idVenda}">
							<div class="row">
								<!-- 
								<div class="col-1">
									<i class="bi bi-dash-lg"></i>
								</div>
								-->
								<div class"col-1">
								   	#SELECT_STATUS_ANDAMENTO
									<i style="cursor: pointer;" class="text-success bi bi-check-circle-fill" onclick="atualizarStatus(${venda.idVenda})"></i>Atualizar status
								</div>
								<!--								
								<div class="col-1">
									<i class="bi bi-plus-lg"></i>
								</div>
								-->
							</div>
						</form>
						</div>
		      	  </td>
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		R$${venda.valor}
		      		</div>
		      	  </td>
		      	  <td>
		      	  	${venda.data}
		      	  </td>
			    </tr>
			`;

	let selectStatusAndamento = `
		<select name='status'>
			#OPTION_RESERVADO
		</select>
	`;

	statusAndamento.forEach(status => {
		let isWithSelected = (venda.idStatusAndamento == status.idStatus) ? "selected=''" : "";
		selectStatusAndamento = selectStatusAndamento.replace("#OPTION_RESERVADO", "<option " + isWithSelected + " value='" + status.idStatus + "'>" + status.nome + "</option> #OPTION_RESERVADO");
	});

	selectStatusAndamento = selectStatusAndamento.replace("#OPTION_RESERVADO", "");

	linhaVenda = linhaVenda.replace("#SELECT_STATUS_ANDAMENTO", selectStatusAndamento);


	return linhaVenda;
}

function atualizarStatus(idVenda) {
	let selectStatusAndamento = "#venda_" + idVenda + " select[name='status']";
	$.ajax({
		url: "vendas/atualizarStatus",
		type: "GET",
		data: {
			idVenda: idVenda,
			statusAndamento: $(selectStatusAndamento).val()
		},
		success: function(response) {
			alert("Atualizado com sucesso!");
		}
	});

}
