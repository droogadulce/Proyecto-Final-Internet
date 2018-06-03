package servicio;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import Pojo.Document;

public interface DocumentService {
	
	public void savedocumentfile( Document document, MultipartFile file ) ;
	public List<Document> list() ;
	public Document get( Integer id ) ;
	public void remove( Integer id ) ;	
	public void download( Integer documentId, HttpServletResponse response );
}
