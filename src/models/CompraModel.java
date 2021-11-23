package models;

import com.mysql.fabric.xmlrpc.base.Data;

public class CompraModel {
	private int idCompra;
	private int idUsuario;
	private int idStatusAndamento;
	private Data data;
	private Float valor;
	
	
	public CompraModel() { }
	
	public CompraModel(int idCompra, int idUsuario, int idStatusAndamento, Data data, Float valor) {
		super();
		this.idCompra = idCompra;
		this.idUsuario = idUsuario;
		this.idStatusAndamento = idStatusAndamento;
		this.data = data;
		this.valor = valor;
	}
	
	
	
	
	public int getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
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
