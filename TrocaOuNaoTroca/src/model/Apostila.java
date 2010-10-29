package model;

public class Apostila extends Item {
	
	private String autor;
	private String editora;
	private int edicao;
	
	/*public Apostila (String titulo, String descricao_item, String categoria, String imagem_item, int status_item, String autor, String editora, int edicao){
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
}
