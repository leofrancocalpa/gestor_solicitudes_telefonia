/**
Declaracion del paquete para registrar y sus objetos publicos
*/
CREATE OR REPLACE PACKAGE pkRegistroNivel2 AS
    /**
        Procedimiento que permite registrar un cliente no existente en la bd
        
        @param ivCedulaCliente IN CLIENTE.CEDULA%TYPE
            cedula documento de identificacion del Cliente
        @param ivNombreCliente IN CLIENTE.NOMBRE%TYPE
            Nombre comleto del cliente
        @param ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE
            Fecha de nacimiento del cliente
        @param ivDireccionCliente IN CLIENTE.DIRECCION%TYPE
            Direcccion de ubicacion del cliente
        @param ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
            Numero de telefono de contacto del cliente
        */
        
     PROCEDURE pRegistrarCliente(
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
    );
    
     /**
            Procedimiento que permite registrar un Funcionario no existente en la bd
            
            @param ivCedulaCliente IN CLIENTE.CEDULA%TYPE
                cedula documento de identificacion del funcionario
            @param ivNombreCliente IN CLIENTE.NOMBRE%TYPE
                Nombre comleto del funcionario
            @param ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE
                Direcccion de ubicacion del funcionario
            @param ivDireccionCliente IN CLIENTE.DIRECCION%TYPE
                Direcccion de ubicacion del funcionario
            @param ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
                Numero de telefono de contacto del funcionario
            */
    PROCEDURE pRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    );
   
   /**
       Procedimiento que permite registrar un nuevo tipo de producto a la bd
       @param ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE
            Codigo definido para el tipo de producto
       @param ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE
            nombre para el tipo de producto
       @param ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
            caracteristicas del tipo de producto
       */
   PROCEDURE pRegistrarTipoProducto(
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE,
        ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
    );
    
   -- PROCEDURE pRegistrarProdcuto(
    --    ivIdProducto IN PRODUCTO.ID%TYPE,
    --    ivNombreProducto IN PRODUCTO.NOMBRE%TYPE,
     --   ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE
   -- );
    
   -- PROCEDURE pRegistrarAnomalia(
    --    ivIdeAnomalia IN ANOMALIA.ID%TYPE,
    --    ivNombreAnomalia IN  ANOMALIA.NOMBRE%TYPE
    --);
    
    /**
        Procediemiento para radicar una solicitud
        
        @param ivObservacion IN SOLICITUD.OBSERVACION%TYPE
            Observaciones del cliente sobre la solicitud
        @param ivCedulaCliente IN CLIENTE.CEDULA%TYPE
            cedula documento de identificacion del Cliente
        @param ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE
            codigo correspondiente al tipo de solicitud que desea radicar
        @param --ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
            Obsoleto
        @param ivIdProducto IN PRODUCTO.ID%TYPE
            Id del producto ligado a la solicitud de ser nuevo sera 'xxxx' por defecto mientras se crea
        @param ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE
            texto con la causa de cancelacion si la solicitud es de tipo cancelacion, sino 'xxxx'
        @param ivIdAnomalia IN ANOMALIA.ID%TYPE
            Si la solicitud es sobre un dano : identificacion del tipo de anomalia
        */
    PROCEDURE pRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
        --ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    );
    
END pkRegistroNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkRegistroNivel2 AS

    PROCEDURE pRegistrarCliente(
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
    ) IS
        BEGIN
            pkClienteNivel1.pInsertar(
                ivCedulaCliente,
                ivNombreCliente,
                ivFechaNacimientoCliente,
                ivDireccionCliente,
                ivTelefonoCliente
            );
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-1,'Ya existe un cliente registrado con esta identificacion');
            WHEN OTHERS THEN
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
     
  PROCEDURE pRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
       -- ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    ) IS
    	vFechaCreacion SOLICITUD.FECHA_CREACION%TYPE;
    	vFechaAsignacion SOLICITUD.FECHA_ASIGNACION%TYPE;
    	vFechaAtencion SOLICITUD.FECHA_ATENCION%TYPE;
    	vEstado SOLICITUD.ESTADO%TYPE;
        vComentarioFuncionario SOLICITUD.COMENTARIO_FUNCIONARIO%TYPE;
        vNumeroSolicitud SOLICITUD.NUMERO_SOLICITUD%TYPE;
        vCedulaFuncionario FUNCIONARIO.CEDULA%TYPE;
	
    BEGIN
	    vNumeroSolicitud := pkSolicitudNivel1.fNextNumeroSolicitud;
	    vFechaCreacion := SYSDATE;
	    vFechaAsignacion := NULL;
    	vFechaAtencion := NULL;
    	vEstado := pkSolicitudNivel1.ESTADO_PENDIENTE;
    	vComentarioFuncionario:=NULL;
   		vCedulaFuncionario:='xxxx';
        
    	pkSolicitudNivel1.pinsertarsolicitud(
    		vNumeroSolicitud,
    		ivObservacion,
    		vFechaCreacion,
    		vFechaAsignacion,
    		vFechaAtencion,
    		ivCausaCancelacionSolicitud,
    		vComentarioFuncionario,
    		vEstado,
    		ivCedulaCliente,
    		ivIdAnomalia,
    		ivCodigoTipoSolicitud,
    		vCedulaFuncionario,
    		ivIdProducto
    		);
    	EXCEPTION 
    		WHEN OTHERS THEN
    			RAISE_APPLICATION_ERROR(-1,'No se logro registrar la solicitud');
    		
    END pRegistrarSolicitud;
    
    PROCEDURE pRegistrarTipoProducto(
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE,
        ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
    ) IS
        BEGIN
            pkTipoProductoNivel1.pinsertar(
                ivCodigoTipoProducto,
                ivNombreTipoProducto,
                ivDescripcionTipoProducto
            );
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE_APPLICATION_ERROR(-1,'Ya existe un tipo de producto con este codigo');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-1,'No se puede registrar el tipo de producto');
        END pRegistrarTipoProducto;
        
END pkRegistroNivel2;