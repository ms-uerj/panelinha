package model;

public class Dvd extends Item {
	
	private String estudio;
	
	public Dvd (String titulo, String descricao_item, String categoria, String imagem_item, String status_item, String estudio){
		super(titulo, descricao_item, categoria, imagem_item, status_item);
	    this.estudio = estudio;		
	}	
	
	public String getEstudio() {
		return estudio;
	}

	public void setEstudio(String estudio) {
		this.estudio = estudio;
	}
	
}
