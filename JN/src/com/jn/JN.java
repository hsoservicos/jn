package com.jn;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class JN extends Application {

	@Override
	public void start(Stage stage) {

		try {

			Parent root = FXMLLoader.load(getClass().getResource("JN.fxml"));

			Scene scene = new Scene(root);

			stage.setTitle("JN Informática");
			stage.setScene(scene);
			stage.show();
			System.out.println("Iniciou!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
		launch(args);
	}

}
