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
	private String descricao;
	
	public ProdutoModel() { }
	
	public ProdutoModel(String idProduto) {
		super();
		this.setIdProduto(Integer.parseInt(idProduto));
	}
	
	public ProdutoModel(int idProduto, int idCategoria, int idFornecedor, String nome, String marca, Double preco, Double custo, int quantidade, String imagem, String descricao) {
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
		this.descricao = descricao;
	}

	// Listar produtos com parâmetros de categoria e limite (utilizado na tela inicial)
	public String listar(String idCategoria, String limit) {
		ResultSet query = DB.executarQuery("SELECT * FROM Produto WHERE idCategoria = " + idCategoria +  " limit " + limit);
				
		JsonObject json = new JsonObject();
		
		try {
			int i = 0;
			
			while(query.next()) {
				JsonObject innerObject = new JsonObject();
				
				innerObject.addProperty("idProduto", query.getString("idProduto"));
				innerObject.addProperty("nome", query.getString("nome"));
				innerObject.addProperty("preco", query.getString("preco"));
				innerObject.addProperty("marca", query.getString("marca"));
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
	
	// Listar produto por idProduto, retorna apenas um produto se encontrado
	public String ler() {
		ResultSet result  = DB.executarQuery("SELECT * FROM Produto where idProduto = " + Integer.toString(this.getIdProduto()));
		
		JsonObject json = new JsonObject();
		
		try {
			if(result.next()) {
				json.addProperty("idProduto", result.getString("idProduto"));
				json.addProperty("nome", result.getString("nome"));
				json.addProperty("marca", result.getString("marca"));
				json.addProperty("preco", result.getString("preco"));
				json.addProperty("quantidade", result.getString("quantidade"));
				json.addProperty("imagem", result.getString("imagem"));
				json.addProperty("descricao", result.getString("descricao"));
			} else {
				json.addProperty("erro", "Nenhum produto encontrado");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return json.toString();
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
	
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
