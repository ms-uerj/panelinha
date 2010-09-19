package model;

import java.util.Calendar;
import java.util.Date;

public class Usuario {

	private String matricula;
	private String nome;
	private String sobrenome;
	private String email;
	private String senha;
	private String sexo;
	private Calendar data_cadastro;

	
	
	public Usuario() {
		super();
	}

	public Usuario(String email, String matricula, String nome, String senha,
			String sexo, String sobrenome) {
		super();
		this.email = email;
		this.matricula = matricula;
		this.nome = nome;
		this.senha = senha;
		this.sexo = sexo;
		this.sobrenome = sobrenome;
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

	public Calendar getData_cadastro() {
		return data_cadastro;
	}

	public void setData_cadastro(Calendar data_cadastro) {
		this.data_cadastro = data_cadastro;
	}
	
	

}
