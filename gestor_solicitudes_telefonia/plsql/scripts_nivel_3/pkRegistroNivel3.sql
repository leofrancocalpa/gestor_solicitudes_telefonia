CREATE OR REPLACE PACKAGE pkRegistroNivel3 AS

/**
    Funcion para insertar un cliente a la deb retorna un mensaje de confirmacion
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
    @return Mensaje d e confirmacion si se confirma
    */
	FUNCTION fRegistrarCliente(
		ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
	) 
	RETURN VARCHAR2;
	
    
    /**
    
    Funcion para insertar un funcionario y retorna un mensaje de confirmacion
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
            @Return Mensaje de confirmacion si se registra
        */
	FUNCTION fRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    ) 
        RETURN VARCHAR2;
    
    /**
        
        @param ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE
            Codigo definido para el tipo de producto
       @param ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE
            nombre para el tipo de producto
       @param ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
            caracteristicas del tipo de producto
        @return mensaje d econfirmacion si se confirma
        */
    FUNCTION fRegistrarTipoProducto(
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE,
        ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
    )
        RETURN VARCHAR2;
    
    FUNCTION fRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
       -- ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    )
        RETURN VARCHAR2;
    
END pkRegistroNivel3;
/

CREATE OR REPLACE PACKAGE BODY pkRegistroNivel3 AS

	FUNCTION fRegistrarCliente(
		ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
	) 
        RETURN VARCHAR2 IS
            BEGIN
                pkRegistroNivel2.pRegistrarCliente(
                ivCedulaCliente,
                ivNombreCliente,
                ivFechaNacimientoCliente,
                ivDireccionCliente,
                ivTelefonoCliente
                );
                    RETURN 'Se ha registrado como Cliente con exito';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;                
    END fRegistrarCliente;

    FUNCTION fRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    ) 
        RETURN VARCHAR2 IS
            BEGIN
                pkRegistroNivel2.pRegistrarFuncionario(
                    ivCedulaFuncionario,
                    ivNombreFuncionario,
                    ivFechaNacimientoFuncionario,
                    ivDireccionFuncionario,
                    ivTelefonoFuncionario
                );
                    RETURN 'El Funcionario se ha registrado con exitos';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;
    END fRegistrarFuncionario;
    
    FUNCTION fRegistrarTipoProducto(
        ivCodigoTipoProducto IN TIPO_PRODUCTO.CODIGO%TYPE,
        ivNombreTipoProducto IN TIPO_PRODUCTO.NOMBRE%TYPE,
        ivDescripcionTipoProducto IN TIPO_PRODUCTO.DESCRIPCION%TYPE
    )
        RETURN VARCHAR2 IS
            BEGIN
                pkRegistroNivel2.pRegistrarTipoProducto(
                    ivCodigoTipoProducto,
                    ivNombreTipoProducto,
                    ivDescripcionTipoProducto
                );
                    RETURN 'Se ha registrado el nuevo tipo de producto con exito';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;
    END fRegistrarTipoProducto;
    
    FUNCTION fRegistrarSolicitud(
        ivObservacion IN SOLICITUD.OBSERVACION%TYPE,
        ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivCodigoTipoSolicitud IN TIPO_SOLICITUD.CODIGO%TYPE,
        --ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivIdProducto IN PRODUCTO.ID%TYPE,
        ivCausaCancelacionSolicitud IN SOLICITUD.CAUSA_CANCELACION%TYPE,
        ivIdAnomalia IN ANOMALIA.ID%TYPE
    )
        RETURN VARCHAR2 IS
            BEGIN
                pkRegistroNivel2.pRegistrarSolicitud(
                    ivObservacion,
                    ivCedulaCliente,
                    ivCodigoTipoSolicitud,
                   -- ivCedulaFuncionario,
                    ivIdProducto,
                    ivCausaCancelacionSolicitud,
                    ivIdAnomalia
                );
                    RETURN 'La solicitud se ha registrado con exito';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;
    END fRegistrarSolicitud;
    
END pkRegistroNivel3;