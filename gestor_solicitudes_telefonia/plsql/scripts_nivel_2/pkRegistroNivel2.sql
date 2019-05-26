CREATE OR REPLACE PACKAGE pkRegistroNivel2 AS
    
     PROCEDURE pRegistrarCliente(
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
    );
    
    PROCEDURE pRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    );
    PROCEDURE pRegistrarTipoProducto(
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE,
        ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
    );
    
    PROCEDURE pRegistrarProdcuto(
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivNombreProducto IN PRODUCTO.NOMBRE%TYPE,
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE
    );
    
    PROCEDURE pRegistrarAnomalia(
        ivIdeAnomalia IN ANOMALIA.ID%TYPE,
        ivNombreAnomalia IN  ANOMALIA.NOMBRE%TYPE
    );
    
    POCEDURE pRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    );
    
END pkRegistroNivel2;

CREATE OR REPLACE PACKAGE BODY pkResgistroNivel2 AS

    PROCEDURE pRegistrarCliente(
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
    ) IS
        BEGIN
            pkClientesNivel1.pInsertar(
                ivCedulaCliente,
                ivNombreCliente,
                ivFechaNacimientoCliente,
                ivDireccionCliente,
                ivTelefonoCliente
            );
        EXCEPTION
            WHEN DUP_VAL_OB_INDEX THEN
                RAISE_APPLICATION_ERROR(-1,'Ya existe un cliente registrado con esta identificacion');
            WHEN OTHER THEN
                RAISE_APPLICATION_ERROR(-1,'No se le logro registar el usuario');
            
    END pRegistrarCliente; 

    PROCEDURE pRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    ) IS
        BEGIN
            pkFuncionarioNivel1.pInsertar(
                ivCedulaFuncionario,
                ivNombreFuncionario,
                ivFechaNacimientoFuncionario,
                ivDireccionFuncionario,
                ivTelefonoFuncionario
            );
        EXCEPTION
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-1,'No se puede registrar el funcionario');
     END pRegistrarFuncionario;  
     
  POCEDURE pRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    ) IS
    	vIdAnomalia ANOMALIA.ID%TYPE;
    	vFechaAsignacion SOLICITUD.FECHA_ASIGNACION%TYPE;
    	vFechaAtencion SOLICITUD.FECHA_ATENCIOM%TYPE;
    	vEstado SOLICITUD.ESTADO%TYPE;
    	vCedulaFuncionario FUNCIONARIO.CEDULA%TYPE;
        vComentarioFuncionario SOLICITUD.COMENTARIO_FUNCIONARIO;
        vNumeroSolicitud SOLICITUD.NUMERO_SOLICITUD;
        vCausaCancelacion SOLICITUD.CAUSA_CANCELACION;
	
    BEGIN
	    vNumeroSolicitud := ;
	    
    
        
END pkResgistroNivel2;