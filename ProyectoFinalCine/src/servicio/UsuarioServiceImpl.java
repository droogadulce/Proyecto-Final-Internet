package servicio;

import org.springframework.beans.factory.annotation.Autowired;

import Pojo.Usuario;
import dao.UsuarioDAO;

/**
 * Agrega un usuario.
 * @author Mayra Aceves
 *
 */
public class UsuarioServiceImpl implements UsuarioService {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Override
	public void add( Usuario usuario ) {
		System.out.println( "Usuario agregado correctamente:" );
		System.out.println( "Nombre: " + usuario.getNombre() );
		System.out.println( "Correo: " + usuario.getCorreo() );
		System.out.println( "No. de Tarjeta: " + usuario.getNumTarjeta() );
		usuarioDAO.add(usuario);
	}
}
