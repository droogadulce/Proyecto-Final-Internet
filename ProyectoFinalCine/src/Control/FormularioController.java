package Control;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Pojo.Compra;
import Pojo.Pelicula;
import Pojo.Usuario;
import servicio.CompraService;
import servicio.UsuarioService;
import validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

/**
 * Controlador para el Formulario de registro de usuario.
 * @author Mayra Aceves
 *
 */
@Controller
@RequestMapping( "/datosFormulario.html" )
public class FormularioController {
	
	private UsuarioService usuarioService;
	private CompraService compraService;
	private UserValidator userValidator;
	
	/**
	 * Constructor por omisión.
	 * @param usuarioService
	 * @param compraService
	 * @param userValidator
	 */
	@Autowired
	public FormularioController( UsuarioService usuarioService, CompraService compraService, UserValidator userValidator) {
		this.usuarioService = usuarioService;
		this.compraService = compraService;
		this.userValidator = userValidator;
	}
	
	/**
	 * Regresa la vista del formulario.
	 * @param model
	 * @param request
	 * @return vista del formulario
	 */
	@RequestMapping( method = RequestMethod.GET )
	public String showUserForm( ModelMap model, HttpServletRequest request ) {
		Usuario usuario = new Usuario();
		model.addAttribute( "usuario", usuario );
		return "Formulario";
	}
	
	/**
	 * Recibe los datos ingresados por el usuario.
	 * Si no se ingresan, regresa el mismo formulario, en otro caso, lo manda a la vista de detalle
	 * de compra
	 * @param usuario el usuario a insertar
	 * @param result
	 * @param request
	 * @param model
	 * @return vista de éxito o el formulario
	 */
	@RequestMapping( method = RequestMethod.POST )
	public String onSubmit( @ModelAttribute("usuario") Usuario usuario,BindingResult result, HttpServletRequest request,ModelMap model ) {
		userValidator.validate( usuario, result );
		if ( result.hasErrors() ) {
			return "Formulario";
		} else {
		usuarioService.add( usuario );
		Pelicula p = PeliculaController.getPelicula();
		Compra c = AsientosController.getCompra();
		compraService.add( c );
		System.out.println("Cantidad: "+c.getCantidadBoletos());
		model.addAttribute("cantidadBoletos", c.getCantidadBoletos());
		model.addAttribute("total", c.getTotal());
		model.addAttribute("asientos", c.getAsientos());
		model.addAttribute("horario", p.getHorario());
		model.addAttribute("fecha", p.getFecha());
		model.addAttribute("nombrePelicula", p.getNombre());
		model.addAttribute("cine", p.getLugar());
		model.addAttribute("sala", p.getSala());
		
		return "userSuccess";
		}
	}
}