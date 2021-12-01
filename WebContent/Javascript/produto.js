function criarCardProduto(produto){
	
	const fotoUrl = "/LojaMusical/FotosProdutos/" + produto.imagem;
	const produtoUrl = "/LojaMusical/produto/info?id=" + produto.idProduto;
	
	let cardProduto = `
		<div class="card" style="width: 18rem;">
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
    	    <input type="number" min="1"  class="form-control" placeholder="1" aria-label="First name">
    	  </div>
    	  <div class="col">
    	  	<div class="d-grid gap-2">
	    	  <button class="btn btn-success" type="button">
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
