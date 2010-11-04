package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Mensagem;

public class MensagemDAO {

	public static void inserirMensagem(Mensagem mensagem)
			throws ClassNotFoundException, SQLException {

		String sql = "Insert into tb_mensagem (remetente, destinatario, data_envio, fk_troca, texto) "
				+ "values (?,?,current_date,?,?)";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, mensagem.getRemetente().getId());
		ps.setInt(2, mensagem.getDestinatario().getId());
		ps.setInt(3, mensagem.getTroca());
		ps.setString(4, mensagem.getTexto());

		ps.execute();

		ps.close();
		conn.close();

	}

	public static ArrayList<Mensagem> buscarMensagens(int idTroca)
			throws ClassNotFoundException, SQLException {

		String sql = "Select * from tb_mensagem where fk_troca=?";

		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1,idTroca);
		ResultSet rs = ps.executeQuery();

		ArrayList<Mensagem> msgs = new ArrayList<Mensagem>();

		while (rs.next()) {
			Mensagem msg = new Mensagem();
			
			msg.setRemetente(UsuarioDAO.buscarUsuario(rs.getString("remetente")));
			msg.setDestinatario(UsuarioDAO.buscarUsuario(rs.getString("destinatario")));
			msg.setDataEnvio(rs.getDate("data_envio"));
			msg.setTroca(idTroca);
			msg.setTexto(rs.getString("texto"));
			
			msgs.add(msg);
		}

		rs.close();
		ps.close();
		conn.close();

		return msgs;

	}

}
