package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import Pojo.Usuario;

public class UserValidator implements Validator {

	String Caractinvalidos = "1234567890!@?{].-|";
	
	public boolean ValidaCaracteres( String Cadena ) {
		
		for( int i=0; i < Cadena.length(); i++ )
		   if ( Caractinvalidos.indexOf( Cadena.charAt(i)) >= 0)		   
			   return false;
		return true;			
	}
	
	@Override
	public boolean supports( Class<?> clazz ) {
		//just validate the User instances
		return true;
		//return User.class.isAssignableFrom( clazz );
     }

	@Override
	public void validate( Object target, Errors errors ) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace( errors, "nombre",
				"nombre.required" );
		ValidationUtils.rejectIfEmptyOrWhitespace( errors, "correo",
				"correo.required" );
		ValidationUtils.rejectIfEmpty( errors, "numTarjeta", "numTarjeta.required" );
				
		Usuario usuario = (Usuario) target;
			 
		System.out.println( "Validando Nombre: " + usuario.getNombre());		
		if ( !ValidaCaracteres( usuario.getNombre() ))
			errors.rejectValue( "nombre", "nombre.carsinvalidos");
	}
	
	public boolean validadorSQL( Usuario user )
	  {
		String pReservadas[] = {"select ", "insert ", "delete ","update ", "create ", "like "};
		boolean error = false;
		for( int i=0; i<pReservadas.length; i++)
		  {
			
			if( user.getNombre().contains(pReservadas[i] ))
			  	error = true;			  
					  
		  }
		return error;
	  }	
}

