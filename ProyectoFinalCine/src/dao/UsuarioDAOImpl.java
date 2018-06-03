package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import Pojo.Usuario;

public class UsuarioDAOImpl implements UsuarioDAO {

private SessionFactory sessionFactory;
    
    public void setSessionFactory( SessionFactory sessionFactory ) {
        this.sessionFactory = sessionFactory;
    }
	
    @Transactional	
	public void add(Usuario usuario) {
    	try {
			/* Realiza la conexion con la base de datos
			 * se crea una sesión, que es como una conexión con la bd */
		      Session session = sessionFactory.openSession();
  		      Transaction transact = session.beginTransaction();	
		try {
			/* Este save es de hibernate
			 * se le pasa el pojo 
			 * ya no hay que escribir cada campo
			 */
		    session.save( usuario );
		    /* Guarda los datos en la BD, si no se pone, no se guardan */
		    transact.commit();
	     }
        catch ( HibernateException e ) {
           	transact.rollback();
           	throw e;
           }
	     finally {
	         session.close();
	       }
       }  catch ( RuntimeException re ) {
	            throw re;
	       } 
	}
	
}
