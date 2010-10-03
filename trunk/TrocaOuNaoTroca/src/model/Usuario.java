package model;

import java.util.Date;

public class Usuario {

	private int id;
	private String matricula;
	private String nome;
	private String sobrenome;
	private String email;
	private String senha;
	private String sexo;
	private Date data_cadastro;
	private String area;

	
	
	public Usuario() {
		super();
	}

	public Usuario(String email, String matricula, String nome, String senha,
			String sexo, String sobrenome, String area) {
		super();
		this.email = email;
		this.matricula = matricula;
		this.nome = nome;
		this.senha = senha;
		this.sexo = sexo;
		this.sobrenome = sobrenome;
		this.area = area;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public Date getData_cadastro() {
		return data_cadastro;
	}

	public void setData_cadastro(Date data_cadastro) {
		this.data_cadastro = data_cadastro;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
	
	
	

}
