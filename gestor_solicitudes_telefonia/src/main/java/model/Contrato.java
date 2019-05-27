package model;

import java.sql.Date;

public class Contrato {
	
	private Date fecha_inicio;
	private Date fecha_fin;
	private String cliente_cedula;
	private String producto_id;
	
	public Contrato() {
		
	}

	public Date getFecha_inicio() {
		return fecha_inicio;
	}

	public void setFecha_inicio(Date fecha_inicio) {
		this.fecha_inicio = fecha_inicio;
	}

	public Date getFecha_fin() {
		return fecha_fin;
	}

	public void setFecha_fin(Date fecha_fin) {
		this.fecha_fin = fecha_fin;
	}

	public String getCliente_cedula() {
		return cliente_cedula;
	}

	public void setCliente_cedula(String cliente_cedula) {
		this.cliente_cedula = cliente_cedula;
	}

	public String getProducto_id() {
		return producto_id;
	}

	public void setProducto_id(String producto_id) {
		this.producto_id = producto_id;
	}

}
