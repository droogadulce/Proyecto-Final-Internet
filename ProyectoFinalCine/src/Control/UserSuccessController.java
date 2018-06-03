package Control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.Compra;

/**
 * Controlador de éxito al registrarse.
 * @author usuario
 *
 */
@Controller
public class UserSuccessController {

	@RequestMapping("/userSuccess.htm")
	public String redirect()
	{
		return "userSuccess";
	}
}

