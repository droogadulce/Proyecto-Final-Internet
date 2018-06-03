package servicio;

import org.springframework.beans.factory.annotation.Autowired;

import Pojo.Compra;
import Pojo.Pelicula;
import dao.CompraDAO;

/**
 * Inserta una compra.
 * @author Mayra Aceves
 *
 */
public class CompraServiceImpl implements CompraService {
	
	@Autowired
	private CompraDAO compraDAO;
	
	@Override
	public void add(Compra compra) {
		System.out.println( "Compra agregado correctamente:" );
		//System.out.println( "Id compra: " + compra.getIdCompra() );
		System.out.println( "Id Película: " + compra.getIdPelicula() );
		//System.out.println( "Id Usuario: " + compra.getIdUsuario() );
		System.out.println( "Cantidad de Boletos: " + compra.getCantidadBoletos() );
		System.out.println( "Asientos: " + compra.getAsientos() );
		System.out.println( "Total de la compra: " + compra.getTotal() );
		compra.setIdUsuario("1");
		compraDAO.add(compra);
	}

}
