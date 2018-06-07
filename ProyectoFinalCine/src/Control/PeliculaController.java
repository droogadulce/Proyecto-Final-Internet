package Control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import Pojo.Compra;
import Pojo.Pelicula;
import servicio.PeliculaService;

import javax.servlet.http.HttpServletResponse;

/**
 * Controlador para las películas.
 * @author Mayra Aceves
 *
 */
@Controller
public class PeliculaController {
	@Autowired
	private PeliculaService peliculaService;
	public static Pelicula pelicula;
	
	/**
	 * Constructor por omisión.
	 * @param peliculaService
	 */
	@Autowired
	public PeliculaController(PeliculaService peliculaService) {
		this.peliculaService = peliculaService;
	}
	
	/**
	 * Obtiene una película.
	 * @return una película
	 */
	public static Pelicula getPelicula() {
		return pelicula;
	}

	/**
	 * Modifica una película.
	 * @param pelicula la nueva película
	 */
	public void setPelicula(Pelicula pelicula) {
		PeliculaController.pelicula = pelicula;
	}
	
	/**
	 * regresa la vista de la película a mostrar.
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/verPeliculaDefault")
	public String showUserForm( ModelMap model, HttpServletRequest request ) {
		pelicula = new Pelicula();
		pelicula = peliculaService.getPelicula("1");
		model.addAttribute( "pelicula", pelicula );
		return "Pelicula";
	}
	
	/**
	 * regresa la vista de la película a mostrar.
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/indexFilm/{idPelicula}")
	public @ResponseBody String showUserFilm( @RequestParam("id") String id, ModelMap model, HttpServletRequest request ) {
		pelicula = new Pelicula();
		pelicula = peliculaService.getPelicula(id);
		model.addAttribute( "pelicula", pelicula );
		return "Pelicula";
	}
	
	/**
	 * Redirige a la vista para seleccionar los asientos.
	 * @param request
	 * @return
	 */
	@RequestMapping( method = RequestMethod.POST )
	public String onSubmit(HttpServletRequest request){
		return "Asientos";
	}
}

