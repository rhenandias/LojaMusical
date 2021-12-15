package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.JsonObject;

import database.DB;

public class Pedido {
	
	private Integer idVenda;
	private Integer idStatus;
	private String nomeStatus;
	private Date data;
	private Integer quantidade;
	private Double valorIndividual;
	private Integer idProduto;
	private String nome;
	private String imagem;
	
	public Pedido() {} ;
	
	public Pedido(Integer idVenda, Integer idStatus, String nomeStatus, Date data, Integer quantidade, Double valorIndividual,
			Integer idProduto, String nome, String imagem) {
		super();
		this.idVenda = idVenda;
		this.idStatus = idStatus;
		this.nomeStatus = nomeStatus;
		this.data = data;
		this.quantidade = quantidade;
		this.valorIndividual = valorIndividual;
		this.idProduto = idProduto;
		this.nome = nome;
		this.imagem = imagem;
	}
	
	public Pedido(Integer idVenda, Integer idStatus, String nomeStatus, String data, Integer quantidade, Double valorIndividual,
			Integer idProduto, String nome, String imagem) {
		super();
		this.idVenda = idVenda;
		this.idStatus = idStatus;
		this.nomeStatus = nomeStatus;
		 DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 try {
			Date date = format.parse(data);
			this.data = date;
		} catch (ParseException e) {
			this.data = null;
			e.printStackTrace();
		}
		this.quantidade = quantidade;
		this.valorIndividual = valorIndividual;
		this.idProduto = idProduto;
		this.nome = nome;
		this.imagem = imagem;
	}

	public Integer getIdVenda() {
		return idVenda;
	}

	public Integer getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(Integer idStatus) {
		this.idStatus = idStatus;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Double getValorIndividual() {
		return valorIndividual;
	}

	public void setValorIndividual(Double valorIndividual) {
		this.valorIndividual = valorIndividual;
	}

	public Integer getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Integer idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getNomeStatus() {
		return nomeStatus;
	}

	public void setNomeStatus(String nomeStatus) {
		this.nomeStatus = nomeStatus;
	}
	
	
	
	

}
