package br.com.gevane.model;

public class Produto {
	public String codBarra;
	public String nome;
	public int qtdAtual;
	public int qtdMinima;
	
	public String getCodBarra() {
		return codBarra;
	}
	public void setCodBarra(String codBarra) {
		this.codBarra = codBarra;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getQtdAtual() {
		return qtdAtual;
	}
	public void setQtdAtual(int qtdAtual) {
		this.qtdAtual = qtdAtual;
	}
	public int getQtdMinima() {
		return qtdMinima;
	}
	public void setQtdMinima(int qtdMinima) {
		this.qtdMinima = qtdMinima;
	}
}
