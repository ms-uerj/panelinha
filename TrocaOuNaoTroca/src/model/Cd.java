package model;

import java.util.Date;

public class Cd implements Item {
	
	private int id;
	private String titulo;
	private String descricao;
	private Categoria categoria;
	private String imagem_url;
	private int status;
	private Date dataCadastro;
	private int dono;
	private String artista;
	private String gravadora;
	private String genero;
	
		
    public String getArtista() {
		return artista;
	}

	public void setArtista(String artista) {
		this.artista = artista;
	}

    public String getGravadora() {
		return gravadora;
	}

	public void setGravadora(String gravadora) {
		this.gravadora = gravadora;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public String getImagem() {
		return imagem_url;
	}

	public void setImagem(String imagem_url) {
		this.imagem_url = imagem_url;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public int getDono() {
		return dono;
	}

	public void setDono(int dono) {
		this.dono = dono;
	}
	
	
	
	

}
