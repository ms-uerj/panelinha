package model;

import java.util.Calendar;

public class Item {

	private String titulo;
	private String descricao_item;
	private String categoria;
	private String imagem_item;
	private int status_item;
	private Calendar data_cadastro;

	public Item() {
		super();
	}

	public Item(String titulo, String descricao_item, String categoria,
			String imagem_item, int status_item) {
		super();
		this.titulo = titulo;
		this.descricao_item = descricao_item;
		this.categoria = categoria;
		this.imagem_item = imagem_item;
		this.status_item = status_item;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao_item() {
		return descricao_item;
	}

	public void setDescricao_item(String descricao_item) {
		this.descricao_item = descricao_item;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getImagem_item() {
		return imagem_item;
	}

	public void setImagem_item(String imagem_item) {
		this.imagem_item = imagem_item;
	}

	public int getStatus_item() {
		return status_item;
	}

	public void setStatus_item(int status_item) {
		this.status_item = status_item;
	}

	public Calendar getData_cadastro() {
		return data_cadastro;
	}

	public void setData_cadastro(Calendar data_cadastro) {
		this.data_cadastro = data_cadastro;
	}
	
	

}