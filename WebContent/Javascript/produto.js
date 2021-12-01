function criarCardProduto(produto){
	
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
		    	<form class="mt-3" style="position: relative; z-index: 10">
		    		#FORMULARIO
		    	</form>
		    </div>
		  </div>
		</div>
	`;
	
	const formularioDisponivel = `
		<div class="row" >
    	  <div class="col">
    	    <input name="quantidade" type="number" min="1"  class="form-control" placeholder="1" aria-label="First name">
    	  </div>
    	  <div class="col">
    	  	<div class="d-grid gap-2">
	    	  <button class="btn btn-success" type="button" onclick=adicionarAoCarrinho('${produto.idProduto}')>
	    	  	<i class="bi bi-cart" style="font-size: 1rem;" ></i>
	    	  	<i class="bi bi-plus" style="font-size: 1rem;" ></i>
	    	  </button>
	    	</div>
    	  </div>
    	</div>
	`;
	
	const formularioIndisponivel = `
		<div class="row " >
    	  <div class="col">
    	  	<div class="d-grid gap-2">
	    	  <button class="btn btn-secondary" type="button" disabled>
	    	  	Indisponível
	    	  </button>
	    	</div>
    	  </div>
    	</div>
	`;
	
	// Verifica a disponibilidade do produto
	if(produto.quantidade > 0){
		cardProduto = cardProduto.replace("#FORMULARIO", formularioDisponivel);
	} else {

		cardProduto = cardProduto.replace("#FORMULARIO", formularioIndisponivel);
	}
	
	// Retorna o card de produto montado
	return cardProduto;
}

function criarCardCarrinhoProduto(produto) {

	const fotoUrl = "/LojaMusical/FotosProdutos/" + produto.imagem;
	const produtoUrl = "/LojaMusical/produto/info?id=" + produto.idProduto;

	let linhaProduto = `
				<tr>
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		<img class="border" src=${fotoUrl} alt="Imagem do Produto" width="100px">
			      		<p class="mx-4">${produto.nome}</p>
			      	</div>
			      </td>
			      <td>
			      	<div class="container-fluid d-flex flex-row align-items-center m-0 p-0">
			      		<p>R$${produto.preco}</p>
		      		</div>
		      	  </td>
			      <td>
				      <div class="d-flex flex-column justify-content-center align-items-center">
						<form>
							<div class="row">
								<!-- 
								<div class="col-1">
									<i class="bi bi-dash-lg"></i>
								</div>
								-->
								<div class"col-1">
								   <input type="number" min="1" class="form-control" placeholder=${produto.quantidade}>
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
		      	  	R$${produto.preco * produto.quantidade}
		      	  </td>
		      	  <td>
		      	  <div class="text-center">
		      			<i class="bi bi-trash icone-excluir" style="color: red"></i>
		      	  </div>
		      	  </td>
			    </tr>
			`;

	return linhaProduto;
}

function adicionarAoCarrinho(idProduto) {
	let idCard = "#" + idProduto;
	let idCardFormInputQuantidade = idCard + " form input[name='quantidade']";
	let quantidade = $(idCardFormInputQuantidade).val();
	quantidade = quantidade == "" ? 1 : quantidade;
	$.ajax({
		type: "GET",
		url: "carrinho/inserirProduto",
		data: {
			idProduto: idProduto,
			quantidade: quantidade
		},
		success:function(response) {
			alert("Sucesso (Não está recebendo o 'sucesso' via ajax. Coloquei só pra gerar o alerta)");
		}
	});
}
