CREATE OR REPLACE PACKAGE pkSolicitudNivel1 AS
--[declaración de objetos públicos]

	ESTADO_PENDIENTE CONSTANT SOLICITUD.ESTADO%TYPE :='PENIENTE';
	ESTADO_ASIGNADA CONSTANT SOLICITUD.ESTADO%TYPE :='ASIGNADA';
	ESTADO_ATENDIDA CONSTANT SOLICITUD.ESTADO%TYPE :='ATENDIDA';
	ESTADO_ANULADA CONSTANT SOLICITUD.ESTADO%TYPE :='ANULADA';
	
    /**
        Proceso que inserta una solicitud en la tabla solicitud con los parametros dados
        @param ivnumero_solicitud         solicitud.numero_solicitud%TYPE
        @param ivobservacion              solicitud.observacion%TYPE
        @param ivfecha_creacion           solicitud.fecha_creacion%TYPE
        @param ivfecha_asignacion         solicitud.fecha_asignacion%TYPE
        @param ivfecha_atencion           solicitud.fecha_atencion%TYPE
        @param ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE
        @param ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE
        @param ivestado                   solicitud.estado%TYPE
        @param ivcliente_cedula           solicitud.cliente_cedula%TYPE
        @param ivanomalia                 solicitud.anomalia_id%TYPE
        @param ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE
        @param ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE
        @param ivproducto_id              solicitud.producto_id%TYPE
        */
    PROCEDURE pinsertarsolicitud (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivobservacion              solicitud.observacion%TYPE,
        ivfecha_creacion           solicitud.fecha_creacion%TYPE,
        ivfecha_asignacion         solicitud.fecha_asignacion%TYPE,
        ivfecha_atencion           solicitud.fecha_atencion%TYPE,
        ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE,
        ivestado                   solicitud.estado%TYPE,
        ivcliente_cedula           solicitud.cliente_cedula%TYPE,
        ivanomalia                 solicitud.anomalia_id%TYPE,
        ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE,
        ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE,
        ivproducto_id              solicitud.producto_id%TYPE
    );

    /**
        funcion que retorna el numero de solicitudes que tiene asignada un funcionario dado
        @param ivfuncionario_cedula solicitud.funcionario_cedula%TYPE
        @return 
        */
    FUNCTION fnumerosolicitudesfuncionario (
        ivfuncionario_cedula solicitud.funcionario_cedula%TYPE
    ) RETURN NUMBER;

    /**
        proceso que elimina un registro de la tabla
        @param ivnumero_solicitud solicitud.numero_solicitud%TYPE
        */
    PROCEDURE peliminarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    );

    /**
        funcion que retorna el registro de una solicitud dada
        @param ivnumero_solicitud solicitud.numero_solicitud%TYPE
        @return 
        */
    FUNCTION fconsultarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    ) RETURN solicitud%rowtype;

/**
    Procedimiento que modifica los valores de un registro de la tabla solicitud
    @param ivnumero_solicitud         solicitud.numero_solicitud%TYPE
    @param ivobservacion              solicitud.observacion%TYPE
    @param ivfecha_asignacion         solicitud.fecha_asignacion%TYPE
    @param ivfecha_atencion           solicitud.fecha_atencion%TYPE
    @param ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE
    @param ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE
    @param ivestado                   solicitud.estado%TYPE
    @param ivcliente_cedula           solicitud.cliente_cedula%TYPE
    @param ivanomalia                 solicitud.anomalia_id%TYPE
    @param ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE
    @param ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE
    @param ivproducto_id              solicitud.producto_id%TYPE
    */
    PROCEDURE pmodificarsolicitud (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivobservacion              solicitud.observacion%TYPE,
        ivfecha_asignacion         solicitud.fecha_asignacion%TYPE,
        ivfecha_atencion           solicitud.fecha_atencion%TYPE,
        ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE,
        ivestado                   solicitud.estado%TYPE,
        ivcliente_cedula           solicitud.cliente_cedula%TYPE,
        ivanomalia                 solicitud.anomalia_id%TYPE,
        ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE,
        ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE,
        ivproducto_id              solicitud.producto_id%TYPE
    );

    /**
        proceso que modifica el funcionario asignado de una solicitud
        @param ivnumero_solicitud     solicitud.numero_solicitud%TYPE
        @param ivfuncionario_cedula   solicitud.funcionario_cedula%TYPE
        */
    PROCEDURE pmodificarfuncionario (
        ivnumero_solicitud     solicitud.numero_solicitud%TYPE,
        ivfuncionario_cedula   solicitud.funcionario_cedula%TYPE
    );

    /**
        proceso que modifica el estado de una solicitud
        @param ivnumero_solicitud   solicitud.numero_solicitud%TYPE
        @param ivestado             solicitud.estado%TYPE
        */
    PROCEDURE pmodificarestado (
        ivnumero_solicitud   solicitud.numero_solicitud%TYPE,
        ivestado             solicitud.estado%TYPE
    );

    /**
        proceso que modifica el comentario de un funcionario a una solicitud dada
        @param ivnumero_solicitud         solicitud.numero_solicitud%TYPE
        @param ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE
        */
    PROCEDURE pmodificarcomentariofuncionario (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE
    );
    
   /**
   * @param ivtipo_solicitud_codigo solicitud.tipo_solicitud_codigo%TYPE
   * @return solicitud.numero_solicitud%TYPE
   */
    FUNCTION fconsultarsolicitudesvencidas (
        ivtipo_solicitud_codigo solicitud.tipo_solicitud_codigo%TYPE
    ) RETURN solicitud.numero_solicitud%TYPE;

    FUNCTION fNextNumeroSolicitud RETURN NUMBER;

END pkSolicitudNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkSolicitudNivel1 AS

    PROCEDURE pinsertarsolicitud (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivobservacion              solicitud.observacion%TYPE,
        ivfecha_creacion           solicitud.fecha_creacion%TYPE,
        ivfecha_asignacion         solicitud.fecha_asignacion%TYPE,
        ivfecha_atencion           solicitud.fecha_atencion%TYPE,
        ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE,
        ivestado                   solicitud.estado%TYPE,
        ivcliente_cedula           solicitud.cliente_cedula%TYPE,
        ivanomalia                 solicitud.anomalia_id%TYPE,
        ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE,
        ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE,
        ivproducto_id              solicitud.producto_id%TYPE
    ) IS
    BEGIN
        INSERT INTO solicitud VALUES (
            ivnumero_solicitud,
            ivobservacion,
            ivfecha_creacion,
            ivfecha_asignacion,
            ivfecha_atencion,
            ivcausa_cancelacion,
            ivcomentario_funcionario,
            ivestado,
            ivcliente_cedula,
            ivanomalia,
            ivtipo_solicitud_codigo,
            ivfuncionario_cedula,
            ivproducto_id
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-1, 'Error. el registro ya existe.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertarsolicitud;

    FUNCTION fnumerosolicitudesfuncionario (
        ivfuncionario_cedula solicitud.funcionario_cedula%TYPE
    ) RETURN NUMBER IS
        ovcantidadsolicitudes NUMBER;
    BEGIN
        SELECT
            COUNT(*)
        INTO ovcantidadsolicitudes
        FROM
            solicitud s
        WHERE
            s.funcionario_cedula = ivfuncionario_cedula;

    END fnumerosolicitudesfuncionario;

    PROCEDURE peliminarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    ) IS
    BEGIN
        DELETE FROM solicitud s
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error, no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END peliminarsolicitud;

    FUNCTION fconsultarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    ) RETURN solicitud%rowtype IS
        ovrowsolicitud solicitud%rowtype;
    BEGIN
        SELECT
            *
        INTO ovrowsolicitud
        FROM
            solicitud s
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

        RETURN ovrowsolicitud;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error, no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultarsolicitud;

    PROCEDURE pmodificarsolicitud (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivobservacion              solicitud.observacion%TYPE,
        ivfecha_asignacion         solicitud.fecha_asignacion%TYPE,
        ivfecha_atencion           solicitud.fecha_atencion%TYPE,
        ivcausa_cancelacion        solicitud.causa_cancelacion%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE,
        ivestado                   solicitud.estado%TYPE,
        ivcliente_cedula           solicitud.cliente_cedula%TYPE,
        ivanomalia                 solicitud.anomalia_id%TYPE,
        ivtipo_solicitud_codigo    solicitud.tipo_solicitud_codigo%TYPE,
        ivfuncionario_cedula       solicitud.funcionario_cedula%TYPE,
        ivproducto_id              solicitud.producto_id%TYPE
    ) IS
    BEGIN
        UPDATE solicitud s
        SET
            s.numero_solicitud = ivnumero_solicitud,
            s.observacion = ivobservacion,
            s.fecha_asignacion = ivfecha_asignacion,
            s.fecha_atencion = ivfecha_atencion,
            s.causa_cancelacion = ivcausa_cancelacion,
            s.comentario_funcionario = ivcomentario_funcionario,
            s.estado = ivestado,
            s.cliente_cedula = ivcliente_cedula,
            s.anomalia_id = ivanomalia,
            s.tipo_solicitud_codigo = ivtipo_solicitud_codigo,
            s.funcionario_cedula = ivfuncionario_cedula,
            s.producto_id = ivproducto_id
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END pmodificarsolicitud;

    PROCEDURE pmodificarfuncionario (
        ivnumero_solicitud     solicitud.numero_solicitud%TYPE,
        ivfuncionario_cedula   solicitud.funcionario_cedula%TYPE
    ) IS
    BEGIN
        UPDATE solicitud s
        SET
            s.funcionario_cedula = ivfuncionario_cedula
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END pmodificarfuncionario;

    PROCEDURE pmodificarestado (
        ivnumero_solicitud   solicitud.numero_solicitud%TYPE,
        ivestado             solicitud.estado%TYPE
    ) IS
    BEGIN
        UPDATE solicitud s
        SET
            s.estado = ivestado
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END pmodificarestado;

    PROCEDURE pmodificarcomentariofuncionario (
        ivnumero_solicitud         solicitud.numero_solicitud%TYPE,
        ivcomentario_funcionario   solicitud.comentario_funcionario%TYPE
    ) IS
    BEGIN
        UPDATE solicitud s
        SET
            s.comentario_funcionario = ivcomentario_funcionario
        WHERE
            s.numero_solicitud = ivnumero_solicitud;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END pmodificarcomentariofuncionario;
    
        FUNCTION fconsultarsolicitudesvencidas (
        ivtipo_solicitud_codigo solicitud.tipo_solicitud_codigo%TYPE
    ) RETURN solicitud.numero_solicitud%TYPE is
        ovnumero_solicitud solicitud.numero_solicitud%TYPE;
        tlimite parametros.tiempo_max_pendiente%TYPE;
    BEGIN
        ovnumero_solicitud := -1;
        tlimite := pkparametrosnivel1.fconsultartiempomaxpendiente();
        SELECT
            s.numero_solicitud
        INTO ovnumero_solicitud
        FROM
            solicitud s
        WHERE
            SYSDATE - s.fecha_asignacion > tlimite
            AND s.tipo_solicitud_codigo = ivtipo_solicitud_codigo
            AND s.estado = 'PENDIENTE'
            AND ovnumero_solicitud <> '-1';
                EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END fconsultarsolicitudesvencidas;

    FUNCTION fNextNumeroSolicitud RETURN NUMBER IS
        ovNextNumeroSolicitud NUMBER;
    BEGIN
        SELECT
            secuence_numero_solicitud.NEXTVAL
        INTO ovNextNumeroSolicitud
        FROM
            DUAL;
    END fNextNumeroSolicitud;

END pkSolicitudNivel1;