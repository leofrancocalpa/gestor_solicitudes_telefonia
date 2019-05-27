CREATE OR REPLACE PACKAGE pkRegistroNivel3 AS

	FUNCTION fRegistrarCliente(
		ivCedulaCliente IN CLIENTE.CEDULA%TYPE,
        ivNombreCliente IN CLIENTE.NOMBRE%TYPE,
        ivFechaNacimientoCliente IN CLIENTE.FECHA_NACIMIENTO%TYPE,
        ivDireccionCliente IN CLIENTE.DIRECCION%TYPE,
        ivTelefonoCliente IN CLIENTE.TELEFONo%TYPE
	) 
	RETURN VARCHAR2;
	
	FUNCTION fRegistrarFuncionario(
        ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE,
        ivNombreFuncionario IN FUNCIONARIO.NOMBRE%TYPE,
        ivFechaNacimientoFuncionario IN FUNCIONARIO.FECHA_NACIMIENTO%TYPE,
        ivDireccionFuncionario IN FUNCIONARIO.DIRECCION%TYPE,
        ivTelefonoFuncionario IN FUNCIONARIO.TELEFONo%TYPE
    ) 
        RETURN VARCHAR2;
    
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