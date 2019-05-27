package controller;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import view.MainView;

public class MainViewController implements Initializable{
	
	private MainView mainView;

    @FXML
    private AnchorPane pane_principal;

    @FXML
    private ImageView imgview_banner_registro;

    @FXML
    private RadioButton rb_funcionario;

    @FXML
    private RadioButton rb_cliente;

    @FXML
    private TextField tx_cedulaInput;

    @FXML
    private Button btn_ingresar;

    @FXML
    private Button btn_registrar;

    @FXML
    void event_btn_ingresar(ActionEvent event) {
    	String cedula = tx_cedulaInput.getText();
    	if(rb_cliente.isSelected() && !cedula.equals(null)) {
    		
    	}
    	else if(rb_funcionario.isSelected() && !cedula.equals(null)) {
    		
    	}

    }

    @FXML
    void event_btn_registrar(ActionEvent event) {
    	mainView.showRegistrarUserView();
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

	public void initialize(URL location, ResourceBundle resources) {
		// TODO Auto-generated method stub
		
	}
	
	public void setMain(MainView mainView) {
		this.mainView = mainView;
	}

}
