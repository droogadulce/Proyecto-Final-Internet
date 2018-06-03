package Pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Modelo para una compra.
 * @author Mayra Aceves
 */
@Entity
@Table( name="Compra")	// Tabla
public class Compra {
	
	@Id
	@GeneratedValue
	@Column(name="idCompra")
	private String idCompra;
	@Column(name="idPelicula")
	private String idPelicula;
	@Column(name="idUsuario")
	private String idUsuario;
	@Column(name="cantidadBoletos")
	private String cantidadBoletos;
	@Column(name="asientos")
	private String asientos;
	
	public String getAsientos() {
		return asientos;
	}
	public void setAsientos(String asientos) {
		this.asientos = asientos;
	}
	private String total;
	public String getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(String idCompra) {
		this.idCompra = idCompra;
	}
	public String getIdPelicula() {
		return idPelicula;
	}
	public void setIdPelicula(String idPelicula) {
		this.idPelicula = idPelicula;
	}
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getCantidadBoletos() {
		return cantidadBoletos;
	}
	public void setCantidadBoletos(String cantidadBoletos) {
		this.cantidadBoletos = cantidadBoletos;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}	
}
