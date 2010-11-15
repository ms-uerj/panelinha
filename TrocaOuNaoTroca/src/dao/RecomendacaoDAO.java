package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import model.Usuario;

public class RecomendacaoDAO {

	public HashMap<String, Integer> buscarCoordenadas(Usuario usuario)
			throws ClassNotFoundException, SQLException {

		HashMap<String, Integer> coordenadas = new HashMap<String, Integer>();

		coordenadas.put("area", UsuarioDAO.buscarAreaUsuario(usuario.getId()));

		ArrayList<HashMap<String, Integer>> cadastrados = buscarQtdItens(usuario, 1);

		Iterator icadastrados = cadastrados.iterator();
		int maior = -1;
		int categoria = 1;
		while (icadastrados.hasNext()) {
			HashMap<String, Integer> cadastrado = (HashMap<String, Integer>) icadastrados
					.next();
			if (cadastrado.get("qtd") > maior) {
				categoria = cadastrado.get("categoria");
			}

		}
		
		coordenadas.put("cadastrados", categoria);
		
		ArrayList<HashMap<String, Integer>> trocados = buscarQtdItens(usuario, 0);

		Iterator itrocados = trocados.iterator();
		int tmaior = -1;
		int tcategoria = 1;
		while (itrocados.hasNext()) {
			HashMap<String, Integer> trocado = (HashMap<String, Integer>) itrocados
					.next();
			if (trocado.get("qtd") < tmaior) {
				tcategoria = trocado.get("categoria");
			}

		}
		
		coordenadas.put("trocados", tcategoria);
		
		

		return coordenadas;

	}

	public static ArrayList<HashMap<String, Integer>> buscarQtdItens(
			Usuario usuario, int status) throws ClassNotFoundException, SQLException {

		String sql = "SELECT count(*) as qtd, i.fk_categoria, c.descricao "
				+ "FROM tb_item as i, tb_categoria as c "
				+ "WHERE i.fk_usuario=? and i.status=? and i.fk_categoria=c.id_categoria group by i.fk_categoria, c.descricao";

		Connection conn = Conexao.obterConexaoMySQL();
		PreparedStatement ps = conn.prepareStatement(sql);

		ps.setInt(1, usuario.getId());
		ps.setInt(2, status);
		ResultSet rs = ps.executeQuery();

		ArrayList<HashMap<String, Integer>> qtds = new ArrayList<HashMap<String, Integer>>();

		while (rs.next()) {
			HashMap<String, Integer> qtd = new HashMap<String, Integer>();
			qtd.put("categoria", rs.getInt("fk_categoria"));
			qtd.put("qtd", rs.getInt("qtd"));

			qtds.add(qtd);
		}

		rs.close();
		ps.close();
		conn.close();

		return qtds;

	}

}
