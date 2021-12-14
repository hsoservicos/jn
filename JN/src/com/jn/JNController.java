package com.jn;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.MenuItem;

public class JNController {

//    @FXML
//    void initialize() {
//    }

    @FXML
    private MenuItem miAreas;

    @FXML
    private MenuItem miClientes;

    @FXML
    private MenuItem miDadosOS;

    @FXML
    private MenuItem miEquipamentos;

    @FXML
    private MenuItem miFechamento;

    @FXML
    private MenuItem miFinalizar;

    @FXML
    private MenuItem miFuncionarios;

    @FXML
    private MenuItem miRegistro;

    @FXML
    private MenuItem miSituacoes;

    @FXML
    void actionFinalizar(ActionEvent event) {
    	System.exit(0);
    }
}
