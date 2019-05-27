	package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.stream.Stream;

public class DbContext {
	
	private Connection connection;
	
	private ArrayList<Cliente> clientes; 
	private ArrayList<Funcionario> funcionarios;
	private ArrayList<Solicitud> solicitudes;
	private ArrayList<Contrato> contratos;
	private ArrayList<Producto> productos;
	private ArrayList<TipoProducto> tipoproductos;
	private ArrayList<TipoSolicitud> tiposolicitudes;
	private ArrayList<Anomalia> anomalias;
	private ArrayList<Parametros> parametros;
	
	private static DbContext dbContext;
	
	
	private DbContext() {
		clientes = new ArrayList<Cliente>();
		funcionarios = new ArrayList<Funcionario>();
		solicitudes = new ArrayList<Solicitud>();
		contratos = new ArrayList<Contrato>();
		productos = new ArrayList<Producto>();
		tipoproductos = new ArrayList<TipoProducto>();
		tiposolicitudes = new ArrayList<TipoSolicitud>();
		anomalias = new ArrayList<Anomalia>();
		parametros = new ArrayList<Parametros>();
		
		try {
			connection = ConnectionDB.getConection();
			loadClientes();
			loadFuncionarios();
			loadSolicitudes();
			loadContratos();
			loadProductos();
			loadTipoProductos();
			loadTipoSolicitudes();
			loadAnomalias();
			loadParametros();
		}
		catch(Exception e) {
			System.out.println("Error "+e.getMessage());
		}
	}
	
	public static DbContext onModelCreate() {
		
		if(dbContext==null) {
			dbContext= new DbContext();
			return dbContext;
		}
		return dbContext;
	}
	
	
	// -- load objects from database
	private void loadClientes() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT c.* FROM Cliente c");
		
		while(rs.next()) {
			
			 String cedula = rs.getString("cedula");
			 String nombre = rs.getString("nombre");
			 Date fecha_nacimiento = rs.getDate("fecha_nacimiento");
			 String direccion = rs.getString("direccion");
			 String telefono = rs.getString("telefono");
			 
			 Cliente cliente = new Cliente();
			 cliente.setCedula(cedula);
			 cliente.setNombre(nombre);
			 cliente.setFecha_nacimiento(fecha_nacimiento);
			 cliente.setDireccion(direccion);
			 cliente.setTelefono(telefono);
			 
			 clientes.add(cliente);
		}
	}
	
	private void loadFuncionarios() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT f.* FROM Funcionario f");
		
		while(rs.next()) {
			
			 String cedula = rs.getString("cedula");
			 String nombre = rs.getString("nombre");
			 Date fecha_nacimiento = rs.getDate("fecha_nacimiento");
			 String direccion = rs.getString("direccion");
			 String telefono = rs.getString("telefono");
			 
			 Funcionario funcionario = new Funcionario();
			 funcionario.setCedula(cedula);
			 funcionario.setNombre(nombre);
			 funcionario.setFecha_nacimiento(fecha_nacimiento);
			 funcionario.setDireccion(direccion);
			 funcionario.setTelefono(telefono);
			 
			 funcionarios.add(funcionario);
		}
	}
	
	private void loadSolicitudes() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT s.* FROM Solicitud s");
		
		while(rs.next()) {
			
			 int numero_solicitud = rs.getInt("numero_solicitud");
			 String observacion = rs.getString("observacion");
			 Date fecha_creacion = rs.getDate("fecha_creacion");
			 Date fecha_asignacion = rs.getDate("fecha_asignacion");
			 Date fecha_atencion = rs.getDate("fecha_atencion");
			 String causa_cancelacion = rs.getString("causa_cancelacion");
			 String comentario_funcionario = rs.getString("comentario_funcionario");
			 String estado = rs.getString("estado");
			 String cliente_cedula = rs.getString("cliente_cedula");
			 String anomalia_id = rs.getString("anomalia_id");
			 String tipo_solicitud_codigo = rs.getString("tipo_solicitud_codigo");
			 String funcionario_cedula = rs.getString("funcionario_cedula");
			 String producto_id = rs.getString("producto_id");
			 
			 Solicitud solicitud = new Solicitud();
			 solicitud.setNumero_solicitud(numero_solicitud);
			 solicitud.setObservacion(observacion);
			 solicitud.setFecha_creacion(fecha_creacion);
			 solicitud.setFecha_asignacion(fecha_asignacion);
			 solicitud.setFecha_atencion(fecha_atencion);
			 solicitud.setCausa_cancelacion(causa_cancelacion);
			 solicitud.setComentario_funcionario(comentario_funcionario);
			 solicitud.setEstado(estado);
			 solicitud.setCliente_cedula(cliente_cedula);
			 solicitud.setAnomalia_id(anomalia_id);
			 solicitud.setTipo_solicitud_codigo(tipo_solicitud_codigo);
			 solicitud.setFuncionario_cedula(funcionario_cedula);
			 solicitud.setProducto_id(producto_id);
			 
			 solicitudes.add(solicitud);
		}
	}
	
	private void loadContratos() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT c.* FROM Contrato c");
		
		while(rs.next()) {
			
			 Date fecha_inicio = rs.getDate("fecha_contrato");
			 Date fecha_fin = rs.getDate("fecha_fin");
			 String cliente_cedula = rs.getString("cliente_cedula");
			 String producto_id = rs.getString("producto_id");
			 
			 Contrato contrato = new Contrato();
			 contrato.setFecha_inicio(fecha_inicio);
			 contrato.setFecha_fin(fecha_fin);
			 contrato.setCliente_cedula(cliente_cedula);
			 contrato.setProducto_id(producto_id);
			 
			 contratos.add(contrato);
		}	
	}
	
	private void loadProductos() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT p.* FROM Producto c");
		
		while(rs.next()) {
			
			 String id = rs.getString("id");
			 String nombre = rs.getString("nombre");
			 String tipo_producto_codigo = rs.getString("tipo_producto_codigo");
			 
			 Producto producto = new Producto();
			 producto.setId(id);
			 producto.setNombre(nombre);
			 producto.setTipo_producto_codigo(tipo_producto_codigo);
			 
			 productos.add(producto);
		}	
	}
	
	private void loadTipoProductos() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT t.* FROM tipo_producto t");
		
		while(rs.next()) {
			
			 String codigo = rs.getString("codigo");
			 String nombre = rs.getString("nombre");
			 String descripcion = rs.getString("descripcion");
			 
			 TipoProducto tipo = new TipoProducto();
			 tipo.setCodigo(codigo);
			 tipo.setNombre(nombre);
			 tipo.setDescripcion(descripcion);
			 
			 tipoproductos.add(tipo);
		}
	}
	
	private void loadTipoSolicitudes() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT t.* FROM tipo_solicitud t");
		
		while(rs.next()) {
			
			 String codigo = rs.getString("codigo");
			 String nombre = rs.getString("nombre");
			 String descripcion = rs.getString("descripcion");
			 
			 TipoSolicitud tipo = new TipoSolicitud();
			 tipo.setCodigo(codigo);
			 tipo.setNombre(nombre);
			 tipo.setDescripcion(descripcion);
			 
			 tiposolicitudes.add(tipo);
		}
	}
	
	private void loadAnomalias() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT a.* FROM anomalia a");
		
		while(rs.next()) {
			
			 String id = rs.getString("id");
			 String nombre = rs.getString("nombre");
			 
			 Anomalia anomalia = new Anomalia();
			 anomalia.setId(id);
			 anomalia.setNombre(nombre);
			 
			 anomalias.add(anomalia);
		}
	}
	
	private void loadParametros() throws SQLException{
		Statement st= connection.createStatement();
		ResultSet rs= st.executeQuery("SELECT p.* FROM anomalia p");
		
		while(rs.next()) {
			
			 int id = rs.getInt("id");
			 int tiempo_max_pendiente = rs.getInt("tiempo_max_pendiente");
			 int num_max_solicitudes = rs.getInt("num_max_solicitudes");
			 
			 Parametros parametros = new Parametros();
			 parametros.setId(id);
			 parametros.setTiempo_max_pendiente(tiempo_max_pendiente);
			 parametros.setNum_max_solicitudes(num_max_solicitudes);
			 			 
			 this.parametros.add(parametros);
		}
	}
	
	
	// -- Getters

	public Connection getConnection() {
		return connection;
	}

	public ArrayList<Cliente> getClientes() {
		return clientes;
	}

	public ArrayList<Funcionario> getFuncionarios() {
		return funcionarios;
	}

	public ArrayList<Solicitud> getSolicitudes() {
		return solicitudes;
	}

	public ArrayList<Contrato> getContratos() {
		return contratos;
	}

	public ArrayList<Producto> getProductos() {
		return productos;
	}

	public ArrayList<TipoProducto> getTipoproductos() {
		return tipoproductos;
	}

	public ArrayList<TipoSolicitud> getTiposolicitudes() {
		return tiposolicitudes;
	}

	public ArrayList<Anomalia> getAnomalias() {
		return anomalias;
	}

	public ArrayList<Parametros> getParametros() {
		return parametros;
	}

}
