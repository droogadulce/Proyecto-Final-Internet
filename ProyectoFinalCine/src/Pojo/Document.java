package Pojo;

import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table( name="documents")	// Tabla

/*
 * Bean.
 * @column es lo que viene en la tabla, es el mapeo
 */
public class Document {
	
	/* Es nuestra responsabilidad llamar la tabla y los campos con el mismo nombre que en la BD. */

	@Id	// ID - llave primaria
	@GeneratedValue	// autoincrementable
	@Column(name="id")
	private Integer id;

	/* las columnas son los campos */
	@Column(name="name")
	private String name;

	@Column(name="description")
	private String description;

	@Column(name="filename")
	private String filename;

	@Column(name="content")
	@Lob
	private Blob content;
	
	@Column(name="content_type")
	private String contentType;
	
	@Column(name="created")
	private Date created;
	
	public Integer getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public String getFilename() {
		return filename;
	}
	public Blob getContent() {
		return content;
	}
	public Date getCreated() {
		return created;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setContent(Blob content) {
		this.content = content;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}	
}
