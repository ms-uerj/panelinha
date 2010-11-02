package model;

import java.util.Date;

public class Mensagem {

	private Usuario remetente;
	private Usuario destinatario;
	private Date dataEnvio;
	private String texto;
	private int troca;

	public Usuario getRemetente() {
		return remetente;
	}

	public void setRemetente(Usuario remetente) {
		this.remetente = remetente;
	}

	public Usuario getDestinatario() {
		return destinatario;
	}

	public void setDestinatario(Usuario destinatario) {
		this.destinatario = destinatario;
	}

	public Date getDataEnvio() {
		return dataEnvio;
	}

	public void setDataEnvio(Date dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public int getTroca() {
		return troca;
	}

	public void setTroca(int troca) {
		this.troca = troca;
	}

}
