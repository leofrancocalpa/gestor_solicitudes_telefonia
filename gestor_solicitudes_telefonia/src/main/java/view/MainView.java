package view;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class MainView extends Application{



	@Override
	public void start(Stage primaryStage) throws Exception {
		FXMLLoader loader = new FXMLLoader();
		Parent root = loader.load(getClass().getResource("/view/fxml/MainForm.fxml").openStream());
		Scene scene = new Scene(root);
		primaryStage.setScene(scene);
		primaryStage.setResizable(false);
		primaryStage.show();
		
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
