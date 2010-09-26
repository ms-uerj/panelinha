package model;

public class Cd extends Item {
	
	private String artista;
	private String gravadora;
	
	public Cd (String titulo, String descricao_item, String categoria, String imagem_item, String status_item, String artista, String gravadora){
		super(titulo, descricao_item, categoria, imagem_item, status_item);
	    this.artista = artista;
	    this.gravadora = gravadora;
	}	
		
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

}
