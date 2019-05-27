package controller;


import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;

public class ClientViewController {

    @FXML
    private TableView<?> table_productos;

    @FXML
    private TableColumn<?, ?> colm_productos_idContrato;

    @FXML
    private TableColumn<?, ?> colm_productos_idProducto;

    @FXML
    private TableColumn<?, ?> colm_productos_nombre;

    @FXML
    private TableColumn<?, ?> colm_productos_tipoProducto;

    @FXML
    private TableColumn<?, ?> colm_productos_descripcion;

    @FXML
    private TableColumn<?, ?> colm_productos_fechaInicio;

    @FXML
    private TableColumn<?, ?> colm_productos_fechaFin;

    @FXML
    private TableView<?> table_solicitud_crear;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_nombre;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_estado;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_tipoProduto;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_observacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_fechaSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_funcionario;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_fechaAsignacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_fecha_atencion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_crear_comentarioFuncionario;

    @FXML
    private TableView<?> table_solicitud_modificar;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_numeroSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_estado;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_tipoProducto;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_observaciones;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_fechaSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_funcionario;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_fechaAsignacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_fechaAtencion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_modificar_comentarioFuncionario;

    @FXML
    private TableView<?> table_solicitud_cancelar;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_numeroSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_estado;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_tipoProducto;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_causaCancelacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_fechaSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_funcionario;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_fechaAsignacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_fechaAtencion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_cancelar_comentarioFuncionario;

    @FXML
    private TableView<?> table_solicitud_danio;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_numeroSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_estado;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_producto;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_anomalia;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_fechaSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_funcionario;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_fechaAsignacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_fechaAtencion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_danio_comentarioFuncionario;

    @FXML
    private TableView<?> table_solicitud_reclamo;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_numeroSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_estado;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_producto;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_observacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_fechaSolicitud;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_funcionario;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_fechaAsignacion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_fechaAtencion;

    @FXML
    private TableColumn<?, ?> colm_solicitud_reclamo_comentarioFuncionario;

    @FXML
    private ChoiceBox<?> combox_crear_tipoProducto;

    @FXML
    private ChoiceBox<?> combox_crear_producto;

    @FXML
    private TextArea text_observacion_solicitudCrear;

    @FXML
    private Button btn_registrarSolicitudCrear;

    @FXML
    private ChoiceBox<?> combox_modificar_tipoProducto;

    @FXML
    private ChoiceBox<?> combox_modificar_producto;

    @FXML
    private Button btn_registrarSolicitudModificar;

    @FXML
    private ChoiceBox<?> combox_cancelar_producto;

    @FXML
    private TextArea text_observacion_solicitudCancelar;

    @FXML
    private Button btn_registrarSolicitudCancelar;

    @FXML
    private ChoiceBox<?> combox_danio_producto;

    @FXML
    private TextArea text_observacion_solicitudDanio;

    @FXML
    private Button btn_registrarSolicitudDanio;

    @FXML
    private ChoiceBox<?> combox_reclamo_producto;

    @FXML
    private TextArea text_observacion_solicitudReclamo;

    @FXML
    private Button btn_registrarSolicitudReclamo;

    @FXML
    void event_btn_registrarSolicitudCancelar(ActionEvent event) {

    }

    @FXML
    void event_btn_registrarSolicitudCrear(ActionEvent event) {

    }

    @FXML
    void event_btn_registrarSolicitudDanio(ActionEvent event) {

    }

    @FXML
    void event_btn_registrarSolicitudModificar(ActionEvent event) {

    }

    @FXML
    void event_btn_registrarSolicitudReclamo(ActionEvent event) {

    }

}