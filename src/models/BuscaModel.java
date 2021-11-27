package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonObject;

import database.DB;

public class BuscaModel {
	private String pesquisa;
	
	// Construtores
	public BuscaModel() {
	}
	
	public BuscaModel(String pesquisa) {
		this.setPesquisa(pesquisa);
	}
	
	public String buscar() {
		ResultSet result  = DB.executarQuery("SELECT * FROM Produto where nome like '%" + this.getPesquisa() +"%'");
		
		JsonObject json = new JsonObject();
		
		try {
			int i = 0;
			
			while(result.next()) {
				JsonObject innerObject = new JsonObject();
				
				innerObject.addProperty("idProduto", result.getString("idProduto"));
				innerObject.addProperty("nome", result.getString("nome"));
				innerObject.addProperty("marca", result.getString("marca"));
				innerObject.addProperty("preco", result.getString("preco"));
				innerObject.addProperty("quantidade", result.getString("quantidade"));
				innerObject.addProperty("imagem", result.getString("imagem"));
				
				json.add(Integer.toString(i), innerObject);
				
				i++;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return json.toString();
	}

	public String getPesquisa() {
		return pesquisa;
	}

	public void setPesquisa(String pesquisa) {
		this.pesquisa = pesquisa;
	}
	
	
}
