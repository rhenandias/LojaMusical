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
import com.mysql.fabric.xmlrpc.base.Data;

import database.DB;

public class VendaModel {
	private int idVenda;
	private int idUsuario;
	private int idStatusAndamento;
	private Date data;
	private Float valor;
	
	
	public VendaModel() { }
	
	public VendaModel(int idVenda, int idUsuario, int idStatusAndamento, Date data, Float valor ) {
		super();
		this.idVenda = idVenda;
		this.idUsuario = idUsuario;
		this.idStatusAndamento = idStatusAndamento;
		this.data = data;
		this.valor = valor;
		
	}
	
	public String listar() {
		List<VendaModel> vendas = new ArrayList<>();
		String query = "SELECT * FROM `Venda`";
		
		ResultSet rs = DB.executarQuery(query);
		try {
			while (rs.next()) {
				Date date = null;
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 try {
					date = format.parse(rs.getString("data"));
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				VendaModel venda = new VendaModel(
					rs.getInt("idVenda"), rs.getInt("idStatus"), rs.getInt("idStatus"), date, rs.getFloat("valor")
				);
				vendas.add(venda);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(vendas);
		return json;
	}
	
	public List<VendaModel> listarEmArray() {
		List<VendaModel> vendas = new ArrayList<>();
		String query = "SELECT * FROM `Venda`";
		
		ResultSet rs = DB.executarQuery(query);
		try {
			while (rs.next()) {
				Date date = null;
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 try {
					date = format.parse(rs.getString("data"));
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
				VendaModel venda = new VendaModel(
					rs.getInt("idVenda"), rs.getInt("idStatus"), rs.getInt("idStatus"), date, rs.getFloat("valor")
				);
				vendas.add(venda);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vendas;
	}
	
	public int getIdVenda() {
		return idVenda;
	}
	public void setIdVenda(int idVenda) {
		this.idVenda = idVenda;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdStatusAndamento() {
		return idStatusAndamento;
	}
	public void setIdStatusAndamento(int idStatusAndamento) {
		this.idStatusAndamento = idStatusAndamento;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Float getValor() {
		return valor;
	}
	public void setValor(Float valor) {
		this.valor = valor;
	}
	
}
 