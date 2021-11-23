package models;

import com.mysql.fabric.xmlrpc.base.Data;

public class VendaModel {
	private int idVenda;
	private int idUsuario;
	private int idStatusAndamento;
	private Data data;
	private Float valor;
	
	
	public VendaModel() { }
	
	public VendaModel(int idVenda, int idUsuario, int idStatusAndamento, Data data, Float valor ) {
		super();
		this.idVenda = idVenda;
		this.idUsuario = idUsuario;
		this.idStatusAndamento = idStatusAndamento;
		this.data = data;
		this.valor = valor;
		
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
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	public Float getValor() {
		return valor;
	}
	public void setValor(Float valor) {
		this.valor = valor;
	}
	
}
