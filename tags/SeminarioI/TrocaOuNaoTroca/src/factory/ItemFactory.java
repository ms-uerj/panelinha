package factory;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Apostila;
import model.Cd;
import model.Dvd;
import model.Item;
import model.Livro;

public class ItemFactory {

	public static Item getItem(int cat, ResultSet rs) throws SQLException {

		switch (cat){
		case 1:
			Livro livro = new Livro();
			livro.setAutor(rs.getString("autor"));
			livro.setEdicao(rs.getInt("edicao"));
			livro.setEditora(rs.getString("editora"));
			return livro;
		case 2:
			Cd cd = new Cd();
			cd.setArtista(rs.getString("autor"));
			cd.setGravadora(rs.getString("editora"));
			cd.setGenero(rs.getString("genero"));
			return cd;
		case 3:
			Dvd dvd = new Dvd();
			dvd.setGenero(rs.getString("genero"));
			return dvd;
		case 4:
			Apostila apostila = new Apostila();
			apostila.setAutor(rs.getString("autor"));
			apostila.setEdicao(rs.getInt("edicao"));
			apostila.setEditora(rs.getString("editora"));
			return apostila;
		}
		
		
		
		return null;

	}

}
