package models;

public class VendaModel {
	private int idVenda;
	private int idUsuario;
	private int idStatusAndamento;
	private String data;
	private Float valor;
	
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
