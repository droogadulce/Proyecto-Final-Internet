package servicio;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import dao.DocumentDAO;
import Pojo.Document;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentDAO documentDAO;

//	@Transactional
	public void savedocumentfile( Document document, MultipartFile file ) {
		
		System.out.println( "Name:" + document.getName() );
		System.out.println( "Desc:" + document.getDescription() );
		System.out.println( "File:" + file.getName() );
		System.out.println( "ContentType:" + file.getContentType() );		
		try {
			/* Objeto blob - objeto largo binario */
			Blob blob = Hibernate.createBlob( file.getInputStream() );
			/* Llenamos la informacion */
			document.setFilename( file.getOriginalFilename() );
			document.setContent( blob );
			document.setContentType( file.getContentType() );
		} catch ( IOException e ) {
			e.printStackTrace();
		}				
		/* Aqui se guarda el documento en la BD */
		documentDAO.save( document );
	}
	
//	@Transactional
	public List<Document> list() {
		return documentDAO.list();
	}

//	@Transactional	
	public  Document get( Integer id ) {
		return documentDAO.get( id );	
	}
	
//	@Transactional
	public void remove( Integer id ) {
		//llama al DAO
		documentDAO.remove( id );
	}
	
	public void download( Integer documentId, HttpServletResponse response ) {
		
		//BD da documento con ese id
		Document doc = this.get( documentId );
		try {
			response.setHeader( "Content-Disposition", "inline;filename=\"" + doc.getFilename() + "\"" );
			/* abrir el archivo
			canal de salida del response*/
			OutputStream out = response.getOutputStream();
			response.setContentType( doc.getContentType() );
			/* leer los bytes del archivo y los envía */
			IOUtils.copy( doc.getContent().getBinaryStream(), out );
			out.flush();
			out.close();		
		} catch ( IOException e ) {
			e.printStackTrace();
		} catch ( SQLException e ) {
			e.printStackTrace();
		}
	}
}

