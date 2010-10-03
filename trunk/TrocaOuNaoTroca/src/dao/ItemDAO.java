package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Item;
import model.Troca;
import factory.ItemFactory;

public class ItemDAO {

	public static ArrayList<Item> buscarItens(String id_usuario)
			throws ClassNotFoundException, SQLException {

		String sql = "Select i.*, c.descricao from tb_item as i, tb_categoria as c where i.fk_usuario=? "
				+ "and fk_categoria=id_categoria and i.status=1 order by i.data_cadastro";

		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, Integer.parseInt(id_usuario));
		ResultSet rs = ps.executeQuery();

		ArrayList<Item> itens = new ArrayList<Item>();

		while (rs.next()) {
			Item item = new Item();

			item.setId(rs.getInt("i.id_item"));
			item.setTitulo(rs.getString("titulo"));
			item.setCategoria(rs.getString("c.descricao"));
			item.setDescricao_item(rs.getString("i.descricao"));
			item.setImagem_item(rs.getString("imagem"));
			item.setStatus_item(0);
			item.setData_cadastro(rs.getDate("data_cadastro"));

			itens.add(item);

		}

		rs.close();
		ps.close();
		conn.close();

		return itens;

	}

	public static Item buscarItem(String codigo) throws ClassNotFoundException,
			SQLException {

		String sql = "Select i.*, c.* from tb_item as i, tb_categoria as c "
				+ "where i.id_item=? and i.fk_categoria=c.id_categoria";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, Integer.parseInt(codigo));
		ResultSet rs = ps.executeQuery();

		Item item = null;

		if (rs.next()) {

			int categoria = rs.getInt("c.id_categoria");

			item = ItemFactory.getItem(categoria, rs);
			item.setCategoria(rs.getString("c.descricao"));
			item.setData_cadastro(rs.getDate("data_cadastro"));
			item.setDescricao_item(rs.getString("i.descricao"));
			item.setId(rs.getInt("id_item"));
			item.setImagem_item(rs.getString("imagem"));
			item.setTitulo(rs.getString("titulo"));
			item.setDono(rs.getInt("fk_usuario"));

		}

		rs.close();
		ps.close();
		conn.close();

		return item;

	}

	public static ArrayList<Item> buscarItens(int id_troca) throws ClassNotFoundException,
			SQLException {

		String sql = "Select i.*, c.* from tb_item as i, tb_categoria as c "
				+ "where i.fk_categoria=c.id_categoria and fk_troca=?";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id_troca);
		ResultSet rs = ps.executeQuery();

		ArrayList<Item> itens = new ArrayList<Item>();

		while (rs.next()) {
			
			Item item = new Item();

			int categoria = rs.getInt("c.id_categoria");

			item = ItemFactory.getItem(categoria, rs);
			item.setCategoria(rs.getString("c.descricao"));
			item.setData_cadastro(rs.getDate("data_cadastro"));
			item.setDescricao_item(rs.getString("i.descricao"));
			item.setId(rs.getInt("id_item"));
			item.setImagem_item(rs.getString("imagem"));
			item.setTitulo(rs.getString("titulo"));
			item.setDono(rs.getInt("fk_usuario"));
			
			itens.add(item);

		}
		
		

		rs.close();
		ps.close();
		conn.close();

		return itens;

	}

	public static void porNaTroca(Troca troca, Item item)
			throws ClassNotFoundException, SQLException {

		String sql = "Update tb_item set fk_troca=? where id_item=?";
		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setDouble(1, troca.getId());
		ps.setInt(2, item.getId());
		ps.execute();

		ps.close();
		conn.close();

	}

}
