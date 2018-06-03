package dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Pojo.Pelicula;

@Repository
public class PeliculaDAOImpl implements PeliculaDAO {

	private SessionFactory sessionFactory;
    
    public void setSessionFactory( SessionFactory sessionFactory ) {
        this.sessionFactory = sessionFactory;
    }
    
    @Transactional
	public void save( Pelicula pelicula ) {
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
		    session.save( pelicula );
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
	
	/*
	 * Conexion con la BD, ya no tenemos que hacerla nosotros
	 * ejecuta el query
	 * estamos usando hibernate jpa
	 * */
	@Transactional
	public List<Pelicula> list() {
		
		Session session = sessionFactory.openSession();
		List<Pelicula> documents = null;
		try {
			/* se selecciona todo de la tabla Pelicula 
			 * regresa una lista
			 * es como hacer un select *
			 * */
			documents = (List<Pelicula>)session.createQuery( "from Pelicula" ).list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return documents;
	}
	
	@Transactional
	public Pelicula getPelicula( String idPelicula ) {
		
		Session session = sessionFactory.openSession();
		return (Pelicula)session.get( Pelicula.class, idPelicula );
	}
	
	@Transactional
	public void remove( Integer idPelicula ) {

		try {
		  Session session = sessionFactory.openSession();
		  Transaction transact = session.beginTransaction();	
		  try {
			  /* Trae todos los documentos cuyo nombre sea el id
			   * es como usar un where 
			   * obtenemos el objeto document
			   */
		    Pelicula pelicula = (Pelicula)session.get( Pelicula.class, idPelicula );
		    if ( pelicula != null ) {
		    		/* sólo borra objetos, no borra por el id */
		       session.delete( pelicula );		    
 	           transact.commit();
             }
        }
	     catch ( HibernateException e ) {
	    	 /* Si hay un error, se hace un rollback y se deja todo como estaba
	    	  * por si la DB está corrompida */
         	transact.rollback();
         	throw e;
           }
         finally {
           session.close();
          }
       }  catch (RuntimeException re) {
         throw re;
      }          						
	}        
}
