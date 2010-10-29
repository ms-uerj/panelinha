package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;
import model.Troca;
import model.Usuario;

public class TrocaDAO {

	public static void inserirTroca(Troca troca) throws ClassNotFoundException,
			SQLException {

		String sql = "Insert into tb_troca (id_troca, fk_user_1, fk_user_2, data_pedido, fk_status) "
				+ "values (?,?,?,current_date,1)";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		Usuario u1 = troca.getUsuario1();
		Usuario u2 = troca.getUsuario2();

		int idTroca = (int) (1+Math.random()*1000);

		ps.setInt(2, u1.getId());
		ps.setInt(3, u2.getId());
		ps.setInt(1, idTroca);
		ps.execute();

		troca.setId(idTroca);

		Item i1 = troca.getItens().get(0);
		Item i2 = troca.getItens().get(1);

		ItemDAO.porNaTroca(troca, i1);
		ItemDAO.porNaTroca(troca, i2);

		ps.close();
		conn.close();

	}

	public static Troca buscarTroca(int id) throws ClassNotFoundException,
			SQLException {

		String sql = "Select * from tb_troca where id_troca=?";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();

		Troca troca = new Troca();

		if (rs.next()) {

			troca.setId(id);
			troca.setDataFim(rs.getDate("data_fim"));
			troca.setDataPedido(rs.getDate("data_pedido"));
			troca.setUsuario1(UsuarioDAO.buscarUsuario(rs.getString("fk_user_1")));
			troca.setUsuario2(UsuarioDAO.buscarUsuario(rs.getString("fk_user_2")));
			
			ArrayList<Item> itens = ItemDAO.buscarItens(id);			
			troca.setItens(itens);

		}

		rs.close();
		ps.close();
		conn.close();

		return troca;

	}

}
