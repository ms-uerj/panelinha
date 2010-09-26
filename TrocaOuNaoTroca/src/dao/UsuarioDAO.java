package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import model.Usuario;

public class UsuarioDAO {

	/*
	 * public static Usuario[] buscarTodos () throws ClassNotFoundException,
	 * SQLException { Usuario usuarios[]; String sql = "Select * from usuarios";
	 * Connection conexao = util.Conexao.obterConexaoMySQL(); PreparedStatement
	 * comando = conexao.prepareStatement(sql); ResultSet resultado =
	 * comando.executeQuery(); usuarios = new
	 * Usuario[UsuarioDAO.getTotalUsuarios()];comando =
	 * conexao.prepareStatement(sql); resultado = comando.executeQuery(); … …
	 * return usuarios; }
	 */

	public static void cadastrarUsuario(Usuario usuario)
			throws ClassNotFoundException, SQLException {

		String sql = "Insert into tb_usuario (nome, email, senha, matricula, sobrenome, sexo, data_cadastro) values (?,?,?,?,?,?, current_date)";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setString(1, usuario.getNome());
		ps.setString(2, usuario.getEmail());
		ps.setString(3, usuario.getSenha());
		ps.setString(4, usuario.getMatricula());
		ps.setString(5, usuario.getSobrenome());
		ps.setString(6, usuario.getSexo());

		ps.execute();

		ps.close();
		conn.close();

	}

	public static int buscarMatricula(String matricula)
			throws ClassNotFoundException, SQLException {

		String sql = "Select count(*) from tb_usuario where matricula=?";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setString(1, matricula);
		ResultSet rs = ps.executeQuery();
		int total = 0;

		if (rs.next()) {
			total = rs.getInt(1);
		}

		rs.close();
		ps.close();
		conn.close();

		return total;

	}

	public static Usuario buscarLogin(String login, String senha)
			throws ClassNotFoundException, SQLException {

		String sql = "Select u.*, a.descricao as area from tb_usuario as u, tb_area as a where " +
				"u.matricula=? and u.senha=? and u.fk_area=a.id_area";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setString(1, login);
		ps.setString(2, senha);
		ResultSet rs = ps.executeQuery();

		Usuario usuario = null;

		if (rs.next()) {
			usuario = new Usuario();

			usuario.setId(rs.getInt("id_usuario"));
			usuario.setMatricula(login);
			usuario.setEmail(rs.getString("email"));
			usuario.setNome(rs.getString("nome"));
			usuario.setSobrenome(rs.getString("sobrenome"));
			usuario.setSexo(rs.getString("sexo"));
			usuario.setArea(rs.getString("area"));

			Date data = rs.getDate("data_cadastro");
			GregorianCalendar data_cadastro = new GregorianCalendar();
			data_cadastro.setTime(data);
			usuario.setData_cadastro(data_cadastro);

		}

		rs.close();
		ps.close();
		conn.close();

		return usuario;

	}

	public static Usuario buscarUsuario(String codigo)
			throws ClassNotFoundException, SQLException {

		String sql = "Select u.*, a.descricao as area from tb_usuario as u, tb_area as a where id_usuario=? and u.fk_area=a.id_area";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, Integer.parseInt(codigo));
		ResultSet rs = ps.executeQuery();

		Usuario usuario = null;

		if (rs.next()) {
			usuario = new Usuario();

			usuario.setId(rs.getInt("id_usuario"));
			usuario.setMatricula(rs.getString("matricula"));
			usuario.setEmail(rs.getString("email"));
			usuario.setNome(rs.getString("nome"));
			usuario.setSobrenome(rs.getString("sobrenome"));
			usuario.setSexo(rs.getString("sexo"));
			usuario.setArea(rs.getString("area"));

			Date data = rs.getDate("data_cadastro");
			GregorianCalendar data_cadastro = new GregorianCalendar();
			data_cadastro.setTime(data);
			usuario.setData_cadastro(data_cadastro);

		}

		rs.close();
		ps.close();
		conn.close();

		return usuario;

	}

}
