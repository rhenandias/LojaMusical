package models;

public class StatusModel {
	private int idStatus;
	private String nome;
	
	public StatusModel() { }
		
	public StatusModel(int idStatus, String nome) {
		super();
		this.idStatus = idStatus;
		this.nome = nome;
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
