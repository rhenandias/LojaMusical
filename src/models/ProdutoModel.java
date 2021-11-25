package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonObject;

import database.DB;

public class ProdutoModel {
	private int idProduto;
	private int idCategoria;
	private int idFornecedor;
	private String nome;
	private String marca;
	private Double preco;
	private Double custo;
	private int quantidade;
	private String imagem;
	
	public ProdutoModel() { }
	
	public ProdutoModel(int idProduto, int idCategoria, int idFornecedor, String nome, String marca, Double preco, Double custo, int quantidade, String imagem) {
		super();
		this.idProduto = idProduto;
		this.idCategoria = idCategoria;
		this.idFornecedor = idFornecedor;
		this.nome = nome;
		this.marca = marca;
		this.preco = preco;
		this.custo = custo;
		this.quantidade = quantidade;
		this.imagem = imagem;
	}

	// Listar produtos com parâmetros de categoria e limite (utilizado na tela inicial)
	public String listar(String idCategoria, String limit) {
		ResultSet query = DB.executarQuery("SELECT * FROM Produto WHERE idCategoria = " + idCategoria +  " limit " + limit);
				
		JsonObject json = new JsonObject();
		
		try {
			int i = 0;
			
			while(query.next()) {
				JsonObject innerObject = new JsonObject();
				
				innerObject.addProperty("idCategoria", query.getString("idProduto"));
				innerObject.addProperty("nome", query.getString("nome"));
				innerObject.addProperty("preco", query.getString("preco"));
				innerObject.addProperty("quantidade", query.getString("quantidade"));
				innerObject.addProperty("imagem", query.getString("imagem"));
				
				json.add(Integer.toString(i), innerObject);
				
				i++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}
	
	// Listar produtos por idProduto (utilizado na página de cada produto)
		public String listar(String idProduto) {
			String query = "SELECT * FROM Produto WHERE idProduto = idProduto";
			
			ResultSet result  = DB.executarQuery(query);
			
			try {
				while(result.next()) {
					System.out.println("Lendo produto:" + result.getString("nome"));
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			
			return "";
		}
	
	public String listar() {
		return "";
	}
	
	public int getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}

	public int getIdCategoria() {
		return idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public int getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(int idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Double getCusto() {
		return custo;
	}

	public void setCusto(Double custo) {
		this.custo = custo;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
}
