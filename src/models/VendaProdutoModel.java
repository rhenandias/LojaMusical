package models;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VendaProdutoModel {
	private int idVendaProduto;
	private int idVenda;
	private int idProduto;
	private int quantidade;
	private float valor;
	
	
	

	public VendaProdutoModel() { }
	
	public VendaProdutoModel(int idVendaProduto, int idVenda, int idProduto, int quantidade, float valor) {
		super();
		this.idVendaProduto = idVendaProduto;
		this.idVenda = idVenda;
		this.idProduto = idProduto;
		this.quantidade = quantidade;
		this.valor = valor;
		
	}
	
	// Listar produtos com p (utilizado na tela inicial)
		public String listar(String idVenda, String limit) {
			String query = "SELECT * FROM VendaProduto WHERE idVenda = idVenda";
			
			ResultSet result  = DB.executarQuery(query);
			
			try {
				while(result.next()) {
					System.out.println(result.getString("nome"));
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			return "";
		}
	
	public int getIdVenda() {
		return idVenda;
	}
	public void setIdVenda(int idVenda) {
		this.idVenda = idVenda;
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
	public int getIdVendaProduto() {
		return idVendaProduto;
	}

	public void setIdVendaProduto(int idVendaProduto) {
		this.idVendaProduto = idVendaProduto;
	}
}
