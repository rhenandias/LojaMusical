package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DB;

public class UsuarioModel {
	private Integer idUsuario;
	private Integer idNivelUsuario;
	private String nome;
	private String email;
	private String telefone;
	private String senha;
	private String cpf;
	private Boolean ativo;
	private String codigoAtivacao;
	private String endereco;
	private String numero;
	private String bairro;
	private String cidade;
	private String estado;
	
	
	
	public UsuarioModel(int idUsuario, int idNivelUsuario, String nome, String email, String telefone, String senha,
			String cpf, Boolean ativo, String codigoAtivacao, String endereco, String numero, String bairro,
			String cidade, String estado) {
		super();
		this.idUsuario = idUsuario;
		this.idNivelUsuario = idNivelUsuario;
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.senha = senha;
		this.cpf = cpf;
		this.ativo = ativo;
		this.codigoAtivacao = codigoAtivacao;
		this.endereco = endereco;
		this.numero = numero;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
	}
	
	public UsuarioModel(String nome, String email, String telefone, String senha,
			String cpf, Boolean ativo, String codigoAtivacao, String endereco, String numero, String bairro,
			String cidade, String estado) {
		super();
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.senha = senha;
		this.cpf = cpf;
		this.ativo = ativo;
		this.codigoAtivacao = codigoAtivacao;
		this.endereco = endereco;
		this.numero = numero;
		this.bairro = bairro;
		this.cidade = cidade;
		this.estado = estado;
	}
	
	public UsuarioModel() {
	
	}
	
	public boolean existCadastro() {
		ResultSet rs1 = DB.executarQuery("SELECT `usuario`.`idUsuario` FROM `lojamusical`.`usuario` WHERE `email` = '"+  this.email + "'");
		
		try {
			if (rs1.next()) {
				return true;
			}
		} catch (SQLException e) {
			return true;
		}
		
		return false;
	}
	
	public boolean cadastrarNoBanco() throws SQLException {
		
		
		String queryInsert = "INSERT INTO `lojamusical`.`usuario`\r\n" + 
					"		(`idUsuario`,\r\n" + 
					"		`idNivelUsuario`,\r\n" + 
					"		`nome`,\r\n" + 
					"		`email`,\r\n" + 
					"		`telefone`,\r\n" + 
					"		`senha`,\r\n" + 
					"		`cpf`,\r\n" + 
					"		`ativo`,\r\n" + 
					"		`codigoAtivacao`,\r\n" + 
					"		`endereco`,\r\n" + 
					"		`numero`,\r\n" + 
					"		`bairro`,\r\n" + 
					"		`cidade`,\r\n" + 
					"		`estado`)\r\n" + 
					"		VALUES\r\n" + 
					"		(null,\r\n" + 
					"		'1','" + 
					this.nome +"','" + 
					this.email +"','" + 
					this.telefone + "','" + 
					this.senha +"','" + 
					this.cpf +"','" + 
					getAtivoInIntForm() +"','" + 
					this.codigoAtivacao +"','" + 
					this.endereco +"','" + 
					this.numero +"','" + 
					this.bairro +"','" + 
					this.cidade +"','" + 
					this.estado +"');";
			
		System.out.println(queryInsert);
			
		ResultSet rs = DB.executarQuery(queryInsert, true);
			
		rs.next();
		Integer id = rs.getInt(1);
		this.idUsuario = id;
			
		
		return true;
		
		
	}
	
	public boolean isUsuarioCadastrado() {
		if (this.idUsuario == null) {
			return false;
		}
		
		
		return true;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}
	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Boolean getAtivo() {
		return ativo;
	}
	public int getAtivoInIntForm() {
		return (ativo == true) ? 1 : 0;
	}
	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}
	public String getCodigoAtivacao() {
		return codigoAtivacao;
	}
	public void setCodigoAtivacao(String codigoAtivacao) {
		this.codigoAtivacao = codigoAtivacao;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
}
