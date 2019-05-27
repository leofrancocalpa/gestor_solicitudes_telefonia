package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import model.GestorOperaciones;

public class RegistroPersonaController {
	
	private GestorOperaciones gestorOperaciones;

    @FXML
    private TextField tx_cedula;

    @FXML
    private TextField tx_nombre;

    @FXML
    private TextField tx_direccion;

    @FXML
    private TextField tx_telefono;

    @FXML
    private DatePicker date_calendario;

    @FXML
    private Button btn_registrar;

    @FXML
    private RadioButton rb_funcionario;

    @FXML
    private RadioButton rb_cliente;

    @SuppressWarnings("deprecation")
	@FXML
    void event_btn_registrar(ActionEvent event) {
    	try {
    		String cedula = tx_cedula.getText();
        	String nombre = tx_nombre.getText();
        	String direccion = tx_direccion.getText();
        	String telefono = tx_telefono.getText();
        	String fecha = date_calendario.getValue().toString();
        	
        	System.out.println(fecha);
        	if(cedula!=null && nombre!=null && direccion!=null && telefono!=null && fecha!=null){
        		
        		
        		if(rb_cliente.isSelected()) {
            		gestorOperaciones.registrarCliente(cedula, nombre, fecha, direccion, telefono);
            	}
            	else if(rb_funcionario.isSelected()) {
            		gestorOperaciones.registrarFuncionario(cedula, nombre, fecha, direccion, telefono);
            	}
        	}
        	else {
        		
        	}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("Error agregar cliente o funcionario " + e.getMessage());
    	}
    	

    }

    @FXML
    void event_rb_cliente(ActionEvent event) {
    	if(rb_funcionario.isSelected()) {
    		rb_funcionario.setSelected(false);
    	}
    }

    @FXML
    void event_rb_funcionario(ActionEvent event) {
    	if(rb_cliente.isSelected()) {
    		rb_cliente.setSelected(false);
    	}
    }
    
    public void setGestorOperaciones(GestorOperaciones gO) {
    	gestorOperaciones = gO;
    }

}

