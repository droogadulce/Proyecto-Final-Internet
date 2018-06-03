package Control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Pojo.Compra;
import servicio.CompraService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

/**
 * Controlador para la selección de asientos.
 * @author usuario
 *
 */
@Controller
public class AsientosController {
	
	private int[] precios = {73,64,64};
	private int totalBoletos;
	private String asientos;
	private int total;
	public static Compra compra;
	
	/**
	 * Obtiene el total de boletos.
	 * @return el total de boletos
	 */
	public int getTotalBoletos() {
		return totalBoletos;
	}

	/**
	 * Modifica el total de boletos.
	 * @param totalBoletos nueva cantidad de boletos.
	 */
	public void setTotalBoletos(int totalBoletos) {
		this.totalBoletos = totalBoletos;
	}

	/**
	 * Obtiene los asientos.
	 * @return los asientos.
	 */
	public String getAsientos() {
		return asientos;
	}

	/**
	 * Modifica los asientos.
	 * @param asientos nuevos asientos.
	 */
	public void setAsientos(String asientos) {
		this.asientos = asientos;
	}

	/**
	 * Obtiene el precio total por los boletos.
	 * @return precio total de los boletos.
	 */
	public int getTotal() {
		return total;
	}

	/**
	 * Modifica el precio total de los boletos.
	 * @param total nuevo precio total de los boletos.
	 */
	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * Obtiene una Compra.
	 * @return la compra.
	 */
	public static Compra getCompra() {
		return compra;
	}

	/**
	 * Modifica la compra.
	 * @param compra nueva compra.
	 */
	public void setCompra(Compra compra) {
		AsientosController.compra = compra;
	}

	
	/**
	 * Regresa la vista de los asientos.
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping( value = "/asientos", method = RequestMethod.POST )
	public String showUserForm( ModelMap model, HttpServletRequest request ) {
		return "Asientos";
	}
	
	/**
	 * Obtiene los valores de la cantidad de asientos seleccionados por el usuario.
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/peticion", method = RequestMethod.POST )
	public String onSubmit(HttpServletRequest request){
		int adulto= Integer.parseInt(request.getParameter("adulto"));
		int mayor= Integer.parseInt(request.getParameter("mayor"));
		int menor= Integer.parseInt(request.getParameter("menor"));
		totalBoletos = adulto + mayor + menor;
		asientos = "A1";
		if (totalBoletos > 1) {
			asientos += "-A"+totalBoletos;
		}
		total = (adulto*precios[0])+(mayor*precios[1])+(menor*precios[2]);
		System.out.println("Adulto "+adulto);
		System.out.println("mayor "+mayor);
		System.out.println("menor "+menor);
		System.out.println("totalBoletos "+totalBoletos);
		System.out.println("asientos "+asientos);
		System.out.println("total "+total);
		compra = new Compra();
		compra.setCantidadBoletos(String.valueOf(totalBoletos));
		compra.setAsientos(asientos);
		compra.setTotal(String.valueOf(total));
		compra.setIdPelicula("1");
	
		return "redirect:/datosFormulario.html";
	}
	
}