package models.vendas;

import java.util.List;

import models.UsuarioModel;
import models.VendaModel;

public class PedidoVenda {
	
	private VendaModel venda;
	private UsuarioModel usuario;
	private List<String> produtos;
	
	
	
	public PedidoVenda(VendaModel venda, UsuarioModel usuario, List<String> produtos) {
		super();
		this.venda = venda;
		this.usuario = usuario;
		this.produtos = produtos;
	}
	
	public VendaModel getVenda() {
		return venda;
	}
	public void setVenda(VendaModel venda) {
		this.venda = venda;
	}
	public UsuarioModel getUsuario() {
		return usuario;
	}
	public void setUsuario(UsuarioModel usuario) {
		this.usuario = usuario;
	}
	public List<String> getProdutos() {
		return produtos;
	}
	public void setProdutos(List<String> produtos) {
		this.produtos = produtos;
	}
	
	
	

}
