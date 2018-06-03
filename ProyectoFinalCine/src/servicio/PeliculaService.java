package servicio;

import Pojo.Pelicula;

/**
 * Interfaz para obtener una película.
 * @author Mayra Aceves
 *
 */
public interface PeliculaService {
	public Pelicula getPelicula(String id);
}