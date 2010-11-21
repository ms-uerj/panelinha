package dao;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;

public class Conexao {
	
	public static Connection obterConexaoMySQL() throws ClassNotFoundException, SQLException
	{
		//Método de conexão
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver);

		String url = "jdbc:mysql://localhost:3306/tont";
		String login = "root";
		String senha = "vertrigo";
		
		Connection conn = DriverManager.getConnection(url, login, senha);
			
		return conn; 
	}


}
