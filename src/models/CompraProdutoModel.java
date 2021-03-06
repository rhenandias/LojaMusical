package models;

public class CompraProdutoModel {
	private int idCompra;
	private int idProduto;
	private int quantidade;
	private float valor;
	
	
	public CompraProdutoModel() {}
	
	public CompraProdutoModel(int idCompra, int idProduto, int quantidade, float valor) {
		super();
		this.idCompra = idCompra;
		this.idProduto = idProduto;
		this.quantidade = quantidade;
		this.valor = valor;
	}
	
	
	public int getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}
}