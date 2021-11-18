package models;

public class FornecedorModel {
	
	private int idFornecedor;
	private String nome;
	private String cpfcnpj;
	private String email;
	private String endereco;
	private String cep;
	private String uf;
	private String cidade;
	private String telefone;
	
	public FornecedorModel() { }
	
	public FornecedorModel(int idFornecedor, String nome, String cpfcnpj, String email, String endereco, String cep, String uf, String cidade, String telefone) {
		super();
		this.idFornecedor = idFornecedor;
		this.nome = nome;
		this.cpfcnpj = cpfcnpj;
		this.email = email;
		this.endereco = endereco;
		this.cep = cep;
		this.uf = uf;
		this.cidade = cidade;
		this.telefone = telefone;
		
	}
	
	
	public int getidFornecedor() {
		return idFornecedor;
	}
	public void setidFornecedor(int idFornecedor) {
		this.idFornecedor = idFornecedor;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCpfcnpj() {
		return cpfcnpj;
	}
	public void setCpfcnpj(String cpfcnpj) {
		this.cpfcnpj = cpfcnpj;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidFornecedorade(String cidade) {
		this.cidade = cidade;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
}
