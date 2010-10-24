package model;

import java.util.Date;

public interface Item {

	public String getTitulo();

	public void setTitulo(String titulo);

	public String getDescricao();

	public void setDescricao(String descricao);

	public Categoria getCategoria();

	public void setCategoria(Categoria categoria);

	public String getImagem();

	public void setImagem(String imagem);

	public int getStatus();

	public void setStatus(int status);

	public Date getDataCadastro();

	public void setDataCadastro(Date dataCadastro);

	public int getId();

	public void setId(int id);

	public int getDono();

	public void setDono(int dono);

}
