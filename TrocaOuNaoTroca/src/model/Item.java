package model;

public class Item {
	
	private String titulo;
	private String descricao_item;
	private String categoria;
	private String imagem_item;
	private String status_item;


public Item() {
	super();
}

public Item(String titulo, String descricao_item, String categoria, String imagem_item,
		String status_item) {
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

public String getStatus_item() {
	return status_item;
}

public void setStatus_item(String status_item) {
	this.status_item = status_item;
}

}
