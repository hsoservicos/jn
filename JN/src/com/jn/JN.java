package com.jn;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class JN extends Application {

	@Override
	public void start(Stage stage) throws IOException {
		Parent root = FXMLLoader.load(getClass().getResource("view/JN.fxml"));

		Scene scene = new Scene(root);

		stage.setScene(scene);
		stage.setTitle("JN Informática");
		stage.show();
		System.out.println("Iniciou!!!");
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
