package model;

import java.util.ArrayList;
import java.util.Date;

public class Troca {

	private int id;
	private Usuario usuario1;
	private Usuario usuario2;
	private Date dataPedido;
	private Date dataFim;
	private int status;
	private ArrayList<Item> itens;
	private ArrayList<Mensagem> mensagens;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario1() {
		return usuario1;
	}

	public void setUsuario1(Usuario usuario1) {
		this.usuario1 = usuario1;
	}

	public Usuario getUsuario2() {
		return usuario2;
	}

	public void setUsuario2(Usuario usuario2) {
		this.usuario2 = usuario2;
	}

	public Date getDataPedido() {
		return dataPedido;
	}

	public void setDataPedido(Date dataPedido) {
		this.dataPedido = dataPedido;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public ArrayList<Item> getItens() {
		return itens;
	}

	public void setItens(ArrayList<Item> itens) {
		this.itens = itens;
	}

	public ArrayList<Mensagem> getMensagens() {
		return mensagens;
	}

	public void setMensagens(ArrayList<Mensagem> mensagens) {
		this.mensagens = mensagens;
	}

}
