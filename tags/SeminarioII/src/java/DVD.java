/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Camilla
 */
 package model;

import java.util.Date;
/** Classe para objetos do tipo DVD, onde serão contidos, metodos e atributos
 * referente ao mesmo.
 * @author Luis Felipe.
 */



public class Dvd implements Item {

	private int id;
	private String titulo;
	private String descricao;
	private Categoria categoria;
	private String imagem_url;
	private int status;
	private Date dataCadastro;
	private int dono;
	private String genero;
/** Metodo para retorno do id  do DVD
 * @return int- id do DVD.
 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
/** Metodo para retorno do título  do DVD
 * @return String- título do DVD.
 */
	public String getTitulo() {
		return titulo;
	}
/** Método para receber o parametro título
     *  @param String- título do DVD
     */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
/** Metodo para retorno da descrição do DVD
 * @return String -descrição do DVD.
 */
	public String getDescricao() {
		return descricao;
	}
/** Método para receber o parametro descrição
     *  @param String- descrição do DVD
     */
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
/** Metodo para retorno da categoria  do DVD
 * @return Categoria- categoria do DVD.
 */
	public Categoria getCategoria() {
		return categoria;
	}
/** Método para receber o parametro categoria
     *  @param Categoria- categoria do DVD
     */
	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
/** Metodo para retorno da imagem  do DVD
 * @return String- imagem_url do DVD.
 */
	public String getImagem() {
		return imagem_url;
	}
/** Método para receber o parametro imagem_url
     *  @param String- imagem_url do DVD
     */
	public void setImagem(String imagem_url) {
		this.imagem_url = imagem_url;
	}
/** Metodo para retorno do status  do DVD
 * @return int- status do DVD.
 */
	public int getStatus() {
		return status;
	}
/** Método para receber o parametro status
     *  @param int- status do DVD
     */
	public void setStatus(int status) {
		this.status = status;
	}
/** Metodo para retorno da dara de cadastro  do DVD
 * @return Date- dada do cadastro  do DVD.
 */
	public Date getDataCadastro() {
		return dataCadastro;
	}
/** Método para receber o parametro data do cadastro
     *  @param Date- data do cadastro do DVD
     */
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
/** Metodo para retorno do dono  do DVD
 * @return int- dono do DVD.
 */
	public int getDono() {
		return dono;
	}
/** Método para receber o parametro dono
     *  @param int- dono do DVD
     */
	public void setDono(int dono) {
		this.dono = dono;
	}
/** Metodo para retorno do genero do DVD
 * @return String- genero do DVD.
 */
	public String getGenero() {
		return genero;
	}
/** Método para receber o parametro genero
     *  @param String- genero do DVD
     */
	public void setGenero(String genero) {
		this.genero = genero;
	}

}
