package Pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Modelo para una película.
 * @author Mayra Aceves
 *
 */
@Entity
@Table( name="Pelicula")	// Tabla
public class Pelicula {
	
	@Id
	@GeneratedValue
	@Column(name="idPelicula")
	private String idPelicula;
	@Column(name="nombre")
	private String nombre;
	@Column(name="clasificacion")
	private String clasificacion;
	@Column(name="version")
	private String version;
	@Column(name="sala")
	private String sala;
	@Column(name="lugar")
	private String lugar;
	@Column(name="horario")
	private String horario;
	@Column(name="precio")
	private String precio;
	@Column(name="fecha")
	private String fecha;
		
	public String getIdPelicula() {
		return idPelicula;
	  }
	public String getNombre() {
		return nombre;
	  }		
	public String getClasificacion() {
		return clasificacion;
	  }		
	public String getVersion() {
		return version;
	  }		
	public String getSala() {
		return sala;
	  }		
	public String getLugar() {
		return lugar;
	  }
	public String getHorario() {
		return horario;
	  }
	public String getPrecio() {
		return precio;
	  }
	public String getFecha() {
		return fecha;
	  }
	
	public void setIdPelicula( String idPelicula ) {
		this.idPelicula = idPelicula;
	  }
	public void setNombre( String nombre ) {
		this.nombre = nombre;
	  }	
	public void setClasificacion( String clasificacion ) {
		this.clasificacion = clasificacion;
	  }	
	public void setVersion( String version ) {
		this.version = version;
	  }	
	public void setSala( String sala ) {
		this.sala = sala;
	  }	
	public void setLugar( String lugar ) {
		this.lugar = lugar;
	  }
	public void setHorario( String horario ) {
		this.horario = horario;
	  }
	public void setPrecio( String precio ) {
		this.precio = precio;
	  }
	public void setFecha( String fecha ) {
		this.fecha = fecha;
	  }
}
