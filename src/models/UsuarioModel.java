package models;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DB;
import models.enums.STATUS;
import services.EnviarEmail;

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
	/**
	 * 
	 * Pega do banco de dados o usuario através o ID passado
	 * @param idUsuario = Id do usuario
	 * 
	 * @throws SQLException = Caso nao exista no banco irá soltar uma exception
	 */
	public UsuarioModel(int idUsuario) throws SQLException {
		this.idUsuario = idUsuario;
		ResultSet rs = DB.executarQuery("SELECT * FROM `usuario` WHERE idUsuario = " + this.idUsuario);
		
		rs.next();
		
		this.idNivelUsuario = rs.getInt("idNivelUsuario");
		this.nome = rs.getString("nome");
		this.email = rs.getString("email");
		this.telefone = rs.getString("telefone");
		this.senha = rs.getString("senha");
		this.cpf = rs.getString("cpf");
		this.ativo = rs.getString("ativo").equals("1") ? true : false;
		this.codigoAtivacao = rs.getString("codigoAtivacao");
		this.endereco = rs.getString("endereco");
		this.numero = rs.getString("numero");
		this.bairro = rs.getString("bairro");
		this.cidade = rs.getString("cidade");
		this.estado = rs.getString("estado");
		
	}
	
	
	public StatusMethod ativarUsuario(String codigoAtivacao) {
		StatusMethod statusMethod = new StatusMethod();
		if (this.ativo) {
			statusMethod.setStatus(STATUS.INFO);
			statusMethod.setTitulo("Usuario já estava ativo");
			statusMethod.setMensagem("Esse usuário já foi ativo anteriormente.");
			
			
		} else if (codigoAtivacao.equals(this.codigoAtivacao)) {
			ResultSet rs1 = DB.executarQuery("UPDATE `usuario` SET ativo = 1 WHERE idUsuario = " + this.idUsuario, true );
			
			this.ativo = true;
			
			statusMethod.setStatus(STATUS.SUCCESS);
			statusMethod.setTitulo("Ativado com sucesso!!");
			statusMethod.setMensagem("Sua conta foi ativada com sucesso!!");
		} else {
			statusMethod.setStatus(STATUS.ERROR);
			statusMethod.setTitulo("Código inválido");
			statusMethod.setMensagem("O código passado está inválido");
		}
		
		return statusMethod;
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
	
	public void gerarCodigoAtivacao() {
		/**
		 * i = Tamanho do codigo
		 */
		int i = 10;
		String theAlphaNumericS;
        StringBuilder builder;
        
        theAlphaNumericS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"; 

        //create the StringBuffer
        builder = new StringBuilder(i); 

        for (int m = 0; m < i; m++) { 

            // generate numeric
            int myindex 
                = (int)(theAlphaNumericS.length() 
                        * Math.random()); 

            // add the characters
            builder.append(theAlphaNumericS 
                        .charAt(myindex)); 
        } 

         String codigo = builder.toString();
         
         String queryUpdate = "UPDATE `usuario` SET codigoAtivacao = '" + codigo + "' WHERE idUsuario = " + this.idUsuario;
         
         ResultSet rs = DB.executarQuery(queryUpdate, true);
         
         this.codigoAtivacao = codigo;
	}
	
	public void enviarEmailDeAtivacao() {
		String link = "http://localhost:8080/LojaMusical/AtivacaoConta?id=" + this.idUsuario + "&codigo=" + this.codigoAtivacao;
		EnviarEmail.enviarEmailAtravesDoGoogle(this.email, "Link para ativação da conta", link);
	}
	
	public boolean cadastrarNoBanco() throws SQLException {
		
		
		
		String queryInsert = "INSERT INTO `usuario`\r\n" + 
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
			
		gerarCodigoAtivacao();
		enviarEmailDeAtivacao();
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
