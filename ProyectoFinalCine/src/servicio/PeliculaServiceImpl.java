package servicio;

import org.springframework.stereotype.Service;
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
import dao.PeliculaDAO;
import Pojo.Document;
import Pojo.Pelicula;

/**
 * Obtiene una película.
 * @author Mayra Aceves
 *
 */
@Service
public class PeliculaServiceImpl implements PeliculaService {
	
	@Autowired
	private PeliculaDAO peliculaDAO;
	
	@Override
	public Pelicula getPelicula(String id) {
		return peliculaDAO.getPelicula(id);
	}
}