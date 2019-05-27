package model;

import java.sql.Date;

public class GestorOperaciones {
	
	private static DbContext dbContex;
	
	public GestorOperaciones() {
		dbContex = DbContext.onModelCreate();
	}
	
	public void registrarCliente(String cedula, String nombre, String fecha_nacimiento, String direccion, String telefono) {
		dbContex.registrarCliente(cedula, nombre, fecha_nacimiento, direccion, telefono);
	}
	
	public void registrarFuncionario(String cedula, String nombre, String fecha_nacimiento, String direccion, String telefono) {
		dbContex.registrarFuncionario(cedula, nombre, fecha_nacimiento, direccion, telefono);
	}
	
	

}
