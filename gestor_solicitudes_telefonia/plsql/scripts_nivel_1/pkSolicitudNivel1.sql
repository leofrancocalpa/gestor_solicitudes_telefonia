CREATE OR REPLACE PACKAGE pkSolicitudNivel1 AS
--[declaración de objetos públicos]

	ESTADO_PENDIENTE CONSTANT SOLICITUD.ESTADO%TYPE :='PENIENTE';
	ESTADO_ASIGNADA CONSTANT SOLICITUD.ESTADO%TYPE :='ASIGNADA';
	ESTADO_ATENDIDA CONSTANT SOLICITUD.ESTADO%TYPE :='ATENDIDA';
	ESTADO_ANULADA CONSTANT SOLICITUD.ESTADO%TYPE :='ANULADA';
	
    PROCEDURE pinsertarsolicitud (
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

    FUNCTION fnumerosolicitudesfuncionario (
        ivfuncionario_cedula solicitud.funcionario_cedula%TYPE
    ) RETURN NUMBER;

    PROCEDURE peliminarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    );

    FUNCTION fconsultarsolicitud (
        ivnumero_solicitud solicitud.numero_solicitud%TYPE
    ) RETURN solicitud%rowtype;

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

    PROCEDURE pmodificarfuncionario (
        ivnumero_solicitud     solicitud.numero_solicitud%TYPE,
        ivfuncionario_cedula   solicitud.funcionario_cedula%TYPE
    );

    PROCEDURE pmodificarestado (
        ivnumero_solicitud   solicitud.numero_solicitud%TYPE,
        ivestado             solicitud.estado%TYPE
    );

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

END pkSolicitudNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkSolicitudNivel1 AS

    PROCEDURE pinsertarsolicitud (
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
        INSERT INTO solicitud VALUES (
            ivnumero_solicitud,
            ivobservacion,
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
            raise_application_error(-20001, 'Error, este registro ya existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error, no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error, no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
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
        tlimite := pkparametrosnivel1.fconsultar_tiempo_max_pendiente();
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
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultarsolicitudesvencidas;

END pkSolicitudNivel1;