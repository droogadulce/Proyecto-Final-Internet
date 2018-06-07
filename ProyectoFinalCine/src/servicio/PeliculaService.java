package servicio;

import java.util.List;

import Pojo.Pelicula;

/**
 * Interfaz para obtener una película.
 * @author Mayra Aceves
 *
 */
public interface PeliculaService {
	public Pelicula getPelicula(String id);
	public List<Pelicula> list();
}