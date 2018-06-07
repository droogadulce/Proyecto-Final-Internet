package Control;

import java.util.Map;
import Pojo.Document;
import servicio.DocumentService;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class DocumentController {

	/* autowired va a tomar el bean que se creo en la fabrica
	 * es el que construimos al final de spring-servlet
	 * con autowired se instancia
	 * ahorramos hacer el new
	 * */
	@Autowired
	private DocumentService documentService;
	
	/*
	 * Regresa un string, regresa una vista
	 * Map es un diccionario (campo, valor)
	 * */
	@RequestMapping("/index")
	public String index( Map<String, Object> map ) {
		try {
			/* Le pasa info a la vista.
			 * requiere un bean (caja vacia) donde se va a guardar el documento
			 * new Document es el bean
			 * */
			map.put( "document", new Document() );
			/* Lista de los documentos que ya existen hasta ahorita
			 * Busca en la base de datos los documentos
			 * Gracias al autowired, se puede llamar a la instancia documentService
			 * */
			map.put( "peliculasList", documentService.list() ); //campo, valor -> bean, el contenido
		} catch( Exception e ) {
			e.printStackTrace();
		}
		// regresamos la vista documents
		return "Inicio";
	}

	@RequestMapping( value = "/save", method = RequestMethod.POST )
	public String save(	@ModelAttribute( "document" ) Document document,
			            @RequestParam( "file" ) MultipartFile file ) {				
		try {
			/* Todavía no se suben los archivos */
			documentService.savedocumentfile( document, file );
		} catch( Exception e ) {
			e.printStackTrace();
		}		
		return "redirect:/index.html";
	}

	@RequestMapping( "/download/{documentId}" )
	public String download( @PathVariable( "documentId" ) Integer documentId, 
			                HttpServletResponse response) {
		/* se recibe la variable del path */
		
		documentService.download( documentId, response );
		/* null para quedarnos en la misma vista */
		return null;
	}

	@RequestMapping( "/remove/{documentId}" )
	public String remove( @PathVariable( "documentId" ) Integer documentId ) {
		
		documentService.remove( documentId );	
		/* actualiza la vista, debido a los documentos que se eliminaron
		 * se podría refrescar sólo una parte de la página con ajax */
		return "redirect:/index.html";
	}
}

