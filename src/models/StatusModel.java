package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;

import database.DB;

public class StatusModel {
	private int idStatus;
	private String nome;
	
	public StatusModel() { }
		
	public StatusModel(int idStatus, String nome) {
		super();
		this.idStatus = idStatus;
		this.nome = nome;
	}
	
	public String listar() {
		List<StatusModel> statusList = new ArrayList<>();
		String query = "SELECT * FROM `StatusAndamento`";
		
		ResultSet rs = DB.executarQuery(query);
		try {
			while (rs.next()) {
				StatusModel status = new StatusModel(
					rs.getInt("idStatus"), rs.getString("nome")
				);
				statusList.add(status);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(statusList);
		return json;
	}
	
	public int getidStatus() {
		return idStatus;
	}
	public void setidStatus(int idStatus) {
		this.idStatus = idStatus;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
