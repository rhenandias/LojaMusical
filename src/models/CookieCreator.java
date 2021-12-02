package models;

public class CookieCreator {
	
	private Integer id;
	private Integer quantidade;
	private String tipo;
	private String nomeCookie;
	
	public CookieCreator(Integer id, Integer quantidade, String tipo) {
		super();
		this.id = id;
		this.quantidade = quantidade;
		this.tipo = tipo;
		if (id != null && quantidade != null && tipo != null) {
			criarNomeCookie();
		}
	}


	public CookieCreator() {
		super();
	}
	
	public void criarNomeCookie() {
		// carrinho_id-10_qtd-1_2018419240
		StringBuilder nomeDoCookie = new StringBuilder();
		nomeDoCookie.append(this.tipo);
		nomeDoCookie.append("_id-"); nomeDoCookie.append(this.id);
		nomeDoCookie.append("_qtd-"); nomeDoCookie.append(this.quantidade);
		
		this.nomeCookie = nomeDoCookie.toString();
	}
	
	public void pegarValoresPeloNomeCookie(String nomeCookie) {
		// carrinho_id-10_qtd-1_2018419240
		String cookieSplit[] = nomeCookie.split("_");
		this.tipo = cookieSplit[0];
		String idSplit[] = cookieSplit[1].split("-");
		this.id = Integer.valueOf(idSplit[1]);

		String qtdSplit[] = cookieSplit[2].split("-");
		this.quantidade = Integer.valueOf(qtdSplit[1]);
		
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getQuantidade() {
		return quantidade;
	}


	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getNomeCookie() {
		return nomeCookie;
	}


	public void setNomeCookie(String nomeCookie) {
		this.nomeCookie = nomeCookie;
	}
	
	
	
	

}
