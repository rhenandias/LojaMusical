function criarCardEstoque(produto){
	
	const fotoUrl = "/LojaMusical/FotosProdutos/" + produto.imagem;
	const produtoUrl = "/LojaMusical/produto/info?id=" + produto.idProduto;
	
	let cardProduto = `
		<div class="card" id="${produto.idProduto}" style="width: 18rem;">
		  <img src=${fotoUrl} class="card-img-top" alt="Imagem do Produto" width="100px">
		  <div class="card-body">
		  	<a href=${produtoUrl} class="stretched-link"></a>
		    <div>
		    	<h5 class="card-title">${produto.nome}</h5>
		    	<h6 class="card-subtitle mb-2 text-muted">${produto.marca}</h6>
		    	<div class="my-2">
			    	<h5 class="card-title">R$${produto.preco}</h5>
		    	</div>
				<div class="my-2">
					#QUANTIDADE
		    	</div>
		    	<form class="mt-3" style="position: relative; z-index: 10">
					<div class="row" >
						<div class="col">
							<input name="quantidade" type="number" min="1" class="form-control" placeholder="1" aria-label="First name">
						</div>
						<div class="col">
							<div class="d-grid gap-2">
							<button class="btn btn-success" type="button" onClick="adicionarQuantidadeAoEstoque(${produto.idProduto})">
								Adicionar ao estoque
							</button>
						</div>
						</div>
					</div>
		    	</form>
		    </div>
		  </div>
		</div>
	`;
	
	const quantidade = `
		<h6 class="card-title">Quantidade: ${produto.quantidade}</h5>
	`;
	
	const quantidadeZerada = `
		<h6 class="card-title text-danger">Quantidade: ${produto.quantidade}</h5>
	`;
	
	// Verifica a disponibilidade do produto
	if(produto.quantidade > 0){
		cardProduto = cardProduto.replace("#QUANTIDADE", quantidade);
	} else {
		cardProduto = cardProduto.replace("#QUANTIDADE", quantidadeZerada);
	}
	
	// Retorna o card de produto montado
	return cardProduto;
}

function adicionarQuantidadeAoEstoque(idProduto) {

	const inputQtdAdicionarEstoque = "#" + idProduto + " form input[name='quantidade']";
	let qtdAdicionarEstoque = $(inputQtdAdicionarEstoque).val();


	$.ajax({
		type: 'POST',
		url: "estoque",
		data: {
			action: 'adicionar',
			idProduto: idProduto,
			quantidade: qtdAdicionarEstoque
		},
		success: function(response) {
			responseJSON = JSON.parse(response);
			if (responseJSON.status == "success") {
				alert("sucesso: " + responseJSON.titulo);
			} else {
				alert("erro: " +  responseJSON.titulo + "; " + responseJSON.mensagem);
			}
			
		}, error: function() {
			alert("Erro ao adicionar ao estoque!");
		}
	});


}