package br.com.gevane.model;

public class Usuario {
	public String nome;
	public String email;
	public String senha;
	
	public Usuario(){
		setEmail("adm@adm");
		setSenha("123");
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
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
}
