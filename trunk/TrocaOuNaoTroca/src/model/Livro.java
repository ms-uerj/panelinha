package model;

import java.util.Date;

public class Livro implements Item {
	
	private int id;
	private String titulo;
	private String descricao;
	private Categoria categoria;
	private String imagem;
	private int status;
	private Date dataCadastro;
	private int dono;
	private String autor;
	private String editora;
	private int edicao;
	
	/*public Livro (String titulo, String descricao_item, String categoria, String imagem_item, int status_item, String autor, String editora, int edicao){
		super(titulo, descricao_item, categoria, imagem_item, status_item);
		this.autor = autor;
		this.editora = editora;
		this.edicao = edicao;
	}*/
	
    public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public String getEditora() {
		return editora;
	}

	public void setEditora(String editora) {
		this.editora = editora;
	}
	
	public int getEdicao() {
		return edicao;
	}

	public void setEdicao(int edicao) {
		this.edicao = edicao;
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
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
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
