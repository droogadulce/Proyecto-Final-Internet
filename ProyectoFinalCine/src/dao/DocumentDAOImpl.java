package dao;

import java.util.List;

import Pojo.Document;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	private SessionFactory sessionFactory;
	                       
    public void setSessionFactory( SessionFactory sessionFactory ) {
        this.sessionFactory = sessionFactory;
    }
    
	@Transactional
	public void save( Document document ) {
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
		    session.save( document );
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
	public List<Document> list() {
		
		Session session = sessionFactory.openSession();
		List<Document> documents = null;
		try {
			/* se selecciona todo de la tabla Document 
			 * regresa una lista
			 * es como hacer un select *
			 * */
			documents = (List<Document>)session.createQuery( "from Document" ).list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return documents;
	}
	
	@Transactional
	public Document get( Integer id ) {
		
		Session session = sessionFactory.openSession();
		return (Document)session.get( Document.class, id );
	}
	
	@Transactional
	public void remove( Integer id ) {

		try {
		  Session session = sessionFactory.openSession();
		  Transaction transact = session.beginTransaction();	
		  try {
			  /* Trae todos los documentos cuyo nombre sea el id
			   * es como usar un where 
			   * obtenemos el objeto document
			   */
		    Document document = (Document)session.get( Document.class, id );
		    if ( document != null ) {
		    		/* sólo borra objetos, no borra por el id */
		       session.delete( document );		    
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
