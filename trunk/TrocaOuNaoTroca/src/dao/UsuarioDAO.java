package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import model.Usuario;

public class UsuarioDAO {
	
	/*public static Usuario[] buscarTodos () throws ClassNotFoundException, SQLException
	{
		Usuario usuarios[];	
		String sql = "Select * from usuarios";
		Connection conexao = util.Conexao.obterConexaoMySQL();
		PreparedStatement comando = conexao.prepareStatement(sql);
		ResultSet resultado = comando.executeQuery();
		usuarios = new Usuario[UsuarioDAO.getTotalUsuarios()];comando = conexao.prepareStatement(sql);
		resultado = comando.executeQuery();
		…
		…
		return usuarios;
	}*/
	
	public static void cadastrarUsuario(Usuario usuario) throws ClassNotFoundException, SQLException
	{
		
		String sql = "Insert into tb_usuario (nome, email, senha, matricula) values (?,?,?,?)";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, usuario.getNome());
		ps.setString(2, usuario.getEmail());
		ps.setString(3, usuario.getSenha());
		ps.setString(4, usuario.getMatricula());
		
		ps.execute();
		
		ps.close();
		conn.close();
		
	}



}
