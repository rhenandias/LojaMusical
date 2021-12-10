package models;

import models.enums.STATUS;

public class StatusMethod {
	
	public STATUS status;
	public String Titulo;
	public String mensagem;

	
	public StatusMethod() {
	}

	public StatusMethod(STATUS status, String titulo, String mensagem) {
		super();
		this.status = status;
		Titulo = titulo;
		this.mensagem = mensagem;
	}
	
	public void setStatusTitutloMensagem(STATUS status, String titulo, String mensagem) {
		this.status = status;
		this.Titulo = titulo;
		this.mensagem = mensagem;
	}

	public STATUS getStatus() {
		return status;
	}


	public void setStatus(STATUS status) {
		this.status = status;
	}


	public String getTitulo() {
		return Titulo;
	}


	public void setTitulo(String titulo) {
		Titulo = titulo;
	}


	public String getMensagem() {
		return mensagem;
	}


	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	
	
	
	
	

}
