package models;

public class CompraModel {
	private int idCompra;
	private int idUsuario;
	private int idStatusAndamento;
	private String data;
	private Float valor;
	
	
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public Float getValor() {
		return valor;
	}
	public void setValor(Float valor) {
		this.valor = valor;
	}
}
