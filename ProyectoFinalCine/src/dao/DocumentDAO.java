package dao;

import java.util.List;
import Pojo.Document;

public interface DocumentDAO {
	
	public void save( Document document ) ;
	public List<Document> list() ;
	public Document get( Integer id ) ;
	public void remove( Integer id ) ;
}

