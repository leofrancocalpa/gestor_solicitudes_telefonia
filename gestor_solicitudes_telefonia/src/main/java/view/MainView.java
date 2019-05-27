package view;

import controller.MainViewController;
import controller.RegistroPersonaController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import model.GestorOperaciones;

public class MainView extends Application{

	private GestorOperaciones gestorOperaciones;
	private MainViewController mainController;
	private Stage primaryStage;
	

	@Override
	public void start(Stage primaryStage) throws Exception {
		this.primaryStage = primaryStage; 
		gestorOperaciones = new GestorOperaciones();
		FXMLLoader loader = new FXMLLoader();
		Parent root = loader.load(getClass().getResource("/view/fxml/MainForm.fxml").openStream());
		mainController = loader.getController();
		mainController.setMain(this);
		Scene scene = new Scene(root);
		this.primaryStage.setScene(scene);
		this.primaryStage.setResizable(false);
		this.primaryStage.show();
		
	}
	
	public void showRegistrarUserView() {
		try {
			FXMLLoader loader = new FXMLLoader();
			Parent root = loader.load(getClass().getResource("/view/fxml/RegistroPersonaView.fxml").openStream());
			Scene scene = new Scene(root);
			RegistroPersonaController regPersonaController = loader.getController();
			regPersonaController.setGestorOperaciones(gestorOperaciones);
			this.primaryStage.setScene(scene);
			this.primaryStage.setResizable(false);
			this.primaryStage.show();
		}
		catch(Exception e) {
			System.out.print("Error al cargar vista registrar usuarios ");
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			launch(args);
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
	}

}
