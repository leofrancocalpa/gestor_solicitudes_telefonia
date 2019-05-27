package model;

public class Parametros {
	
	private int id;
	private int tiempo_max_pendiente;
	private int num_max_solicitudes;
	
	public Parametros() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTiempo_max_pendiente() {
		return tiempo_max_pendiente;
	}

	public void setTiempo_max_pendiente(int tiempo_max_pendiente) {
		this.tiempo_max_pendiente = tiempo_max_pendiente;
	}

	public int getNum_max_solicitudes() {
		return num_max_solicitudes;
	}

	public void setNum_max_solicitudes(int num_max_solicitudes) {
		this.num_max_solicitudes = num_max_solicitudes;
	}
	
	

}
