package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import model.Usuario;

public class RecomendacaoDAO {

	public static double buscarProximidade(Usuario u1, Usuario u2) {

		int area1 = u1.getCoordenadas().get("area");
		int cadastrados1 = u1.getCoordenadas().get("cadastrados");
		int trocados1 = u1.getCoordenadas().get("trocados");

		int area2 = u2.getCoordenadas().get("area");
		int cadastrados2 = u2.getCoordenadas().get("cadastrados");
		int trocados2 = u2.getCoordenadas().get("trocados");

		double prox = Math.sqrt(Math.pow(area1 - area2, 2) + 2
				* (Math.pow(cadastrados1 - cadastrados2, 2)) + 3
				* (Math.pow(trocados1 - trocados2, 2)));

		return prox;
	}

	public static Usuario buscarMaisProximo(Collection<Usuario> usuarios,
			Usuario usuario) {

		double maxProx = 100;
		Usuario proximo = null;
		Iterator<Usuario> iusuarios = usuarios.iterator();

		while (iusuarios.hasNext()) {
			Usuario u2 = (Usuario) iusuarios.next();
			double prox = buscarProximidade(usuario, u2);
			
			System.out.println("Id do u2: "+u2.getId()+" | prox: "+prox);

			if (prox < maxProx) {
				maxProx = prox;
				proximo = u2;

			}

		}

		System.out.println("id que será retornado: "+proximo.getId());
		return proximo;

	}

	public static ArrayList<Usuario> buscarVizinhanca(Usuario usuario)
			throws ClassNotFoundException, SQLException {

		HashMap<String, Integer> coord = usuario.getCoordenadas();

		if (coord == null) {
			coord = buscarCoordenadas(usuario);
			usuario.setCoordenadas(coord);
		}

		HashMap<Integer, Usuario> usuarios = UsuarioDAO.buscarUsuarios(usuario.getId());
		Collection<Usuario> users = usuarios.values();
		
		ArrayList<Usuario> vizinhos = new ArrayList<Usuario>();
		int qtd = 5;
		
		if(users.size()<5){
		   qtd = 5;
		}
		
		for(int i=0;i<qtd;i++){
			System.out.println(users.size()+"\n");
			Usuario vizinho = buscarMaisProximo(users, usuario);
			vizinhos.add(vizinho);
			users.remove(vizinho);
		}

		return vizinhos;
	}

	public static HashMap<String, Integer> buscarCoordenadas(Usuario usuario)
			throws ClassNotFoundException, SQLException {

		HashMap<String, Integer> coordenadas = new HashMap<String, Integer>();

		coordenadas.put("area", UsuarioDAO.buscarAreaUsuario(usuario.getId()));

		ArrayList<HashMap<String, Integer>> cadastrados = buscarQtdItens(
				usuario, 1);

		Iterator icadastrados = cadastrados.iterator();
		int maior = -1;
		int categoria = 1;
		while (icadastrados.hasNext()) {
			HashMap<String, Integer> cadastrado = (HashMap<String, Integer>) icadastrados
					.next();
			if (cadastrado.get("qtd") > maior) {
				categoria = cadastrado.get("categoria");
				maior = cadastrado.get("qtd");
			}

		}

		coordenadas.put("cadastrados", categoria);

		ArrayList<HashMap<String, Integer>> trocados = buscarQtdItens(usuario,
				0);

		Iterator itrocados = trocados.iterator();
		int tmaior = -1;
		int tcategoria = 1;
		while (itrocados.hasNext()) {
			HashMap<String, Integer> trocado = (HashMap<String, Integer>) itrocados
					.next();
			if (trocado.get("qtd") < tmaior) {
				tcategoria = trocado.get("categoria");
				tmaior = trocado.get("qtd");
			}

		}

		coordenadas.put("trocados", tcategoria);

		return coordenadas;

	}

	public static ArrayList<HashMap<String, Integer>> buscarQtdItens(
			Usuario usuario, int status) throws ClassNotFoundException,
			SQLException {

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
