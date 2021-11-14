package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonObject;

import database.DBQuery;

public class CategoriaModel {
	// Variáveis
	private int idCategoria;
	private String nome;
	
	// Manipulação
	private String	tableName = "Categoria";
	private String 	fieldsName = "idCategoria, nome";
	private String 	keyField = "idCategoria";
	private DBQuery	dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	
	// Construtores
	public CategoriaModel() {
	}
	
	public CategoriaModel(int idCategoria, String nome) {
		this.setidCategoria(idCategoria);
		this.setNome(nome);
	}
	
	public CategoriaModel(String idCategoria, String nome) {
		
	}
	
	// Métodos
	
	public String listar() {
		ResultSet result  = this.dbQuery.select("");
		
		JsonObject json = new JsonObject();
		
		try {
			int i = 0;
			
			while(result.next()) {
				JsonObject innerObject = new JsonObject();
				
				innerObject.addProperty("idCategoria", result.getString("idCategoria"));
				innerObject.addProperty("nome", result.getString("nome"));
				
				json.add(Integer.toString(i), innerObject);
				
				i++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}
	
	// Getters e Setters
	
	public int getidCategoria() {
		return idCategoria;
	}
	public void setidCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
}
