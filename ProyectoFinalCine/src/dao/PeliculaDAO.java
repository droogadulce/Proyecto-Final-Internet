package dao;

import java.util.List;

import Pojo.Pelicula;

public interface PeliculaDAO {
	
	public Pelicula getPelicula(String id) ;
	public List<Pelicula> list();
}
