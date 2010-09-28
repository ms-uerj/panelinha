package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import factory.ItemFactory;


import model.Item;
import model.Livro;


public class ItemDAO {

	public static ArrayList<Item> buscarItems(String codigo)
			throws ClassNotFoundException, SQLException {

		String sql = "Select i.*, c.descricao from tb_item as i, tb_categoria as c where i.fk_usuario=? "
				+ "and fk_categoria=id_categoria and i.status=1 order by i.data_cadastro";

		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, Integer.parseInt(codigo));
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

	public static Item buscarItem(String codigo)
			throws ClassNotFoundException, SQLException {

		String sql = "Select i.*, c.* from tb_item as i, tb_categoria as c " +
				"where i.id_item=? and i.fk_categoria=c.id_categoria";
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

}
