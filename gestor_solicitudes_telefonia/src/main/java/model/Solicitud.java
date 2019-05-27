package model;

import java.sql.Date;

public class Solicitud {
	
	private int numero_solicitud;
	private String observacion;
	private Date fecha_creacion;
	private Date fecha_asignacion;
	private Date fecha_atencion;
	private String causa_cancelacion;
	private String comentario_funcionario;
	private String estado;
	private String cliente_cedula;
	private String anomalia_id;
	private String tipo_solicitud_codigo;
	private String funcionario_cedula;
	private String producto_id;
	
	public Solicitud() {
		
	}

	public int getNumero_solicitud() {
		return numero_solicitud;
	}

	public void setNumero_solicitud(int numero_solicitud) {
		this.numero_solicitud = numero_solicitud;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	public Date getFecha_asignacion() {
		return fecha_asignacion;
	}

	public void setFecha_asignacion(Date fecha_asignacion) {
		this.fecha_asignacion = fecha_asignacion;
	}

	public Date getFecha_atencion() {
		return fecha_atencion;
	}

	public void setFecha_atencion(Date fecha_atencion) {
		this.fecha_atencion = fecha_atencion;
	}

	public String getCausa_cancelacion() {
		return causa_cancelacion;
	}

	public void setCausa_cancelacion(String causa_cancelacion) {
		this.causa_cancelacion = causa_cancelacion;
	}

	public String getComentario_funcionario() {
		return comentario_funcionario;
	}

	public void setComentario_funcionario(String comentario_funcionario) {
		this.comentario_funcionario = comentario_funcionario;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCliente_cedula() {
		return cliente_cedula;
	}

	public void setCliente_cedula(String cliente_cedula) {
		this.cliente_cedula = cliente_cedula;
	}

	public String getAnomalia_id() {
		return anomalia_id;
	}

	public void setAnomalia_id(String anomalia_id) {
		this.anomalia_id = anomalia_id;
	}

	public String getTipo_solicitud_codigo() {
		return tipo_solicitud_codigo;
	}

	public void setTipo_solicitud_codigo(String tipo_solicitud_codigo) {
		this.tipo_solicitud_codigo = tipo_solicitud_codigo;
	}

	public String getFuncionario_cedula() {
		return funcionario_cedula;
	}

	public void setFuncionario_cedula(String funcionario_cedula) {
		this.funcionario_cedula = funcionario_cedula;
	}

	public String getProducto_id() {
		return producto_id;
	}

	public void setProducto_id(String producto_id) {
		this.producto_id = producto_id;
	}

	
}
