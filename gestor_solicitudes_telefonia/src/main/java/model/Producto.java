package model;

public class Producto {
	
	private String id;
	private String nombre;
	private String tipo_producto_codigo;
	
	public Producto() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTipo_producto_codigo() {
		return tipo_producto_codigo;
	}

	public void setTipo_producto_codigo(String tipo_producto_codigo) {
		this.tipo_producto_codigo = tipo_producto_codigo;
	}

}
