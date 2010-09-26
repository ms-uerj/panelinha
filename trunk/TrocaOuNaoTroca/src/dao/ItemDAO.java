package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import model.Item;

public class ItemDAO {

	public static ArrayList<Item> buscarItems(String codigo)
			throws ClassNotFoundException, SQLException {

		String sql = "Select i.*, c.descricao from tb_item as i, tb_categoria as c where i.fk_usuario=? " +
				"and fk_categoria=id_categoria and i.fk_status=0 order by i.data_cadastro";
		
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, Integer.parseInt(codigo));
		ResultSet rs = ps.executeQuery();

		ArrayList<Item> itens = new ArrayList<Item>();

		if (rs.next()) {
			Item item = new Item();

			item.setTitulo(rs.getString("titulo"));
			item.setCategoria(rs.getString("c.descricao"));
			item.setDescricao_item(rs.getString("i,descricao"));
			item.setImagem_item(rs.getString("imagem"));
			item.setStatus_item(0);
			

			Date data = rs.getDate("data_cadastro");
			GregorianCalendar data_cadastro = new GregorianCalendar();
			data_cadastro.setTime(data);
			item.setData_cadastro(data_cadastro);
			
			itens.add(item);

		}

		rs.close();
		ps.close();
		conn.close();

		return itens;

	}

}
