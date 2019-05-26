CREATE OR REPLACE PACKAGE pkParametrosNivel1 AS
    PROCEDURE pinsertar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    );

    PROCEDURE peliminar (
        ivid parametros.id%TYPE
    );

    PROCEDURE pmodificar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    );

    FUNCTION fconsultar_tiempo_max_pendiente RETURN parametros.tiempo_max_pendiente%TYPE;

    FUNCTION fconsultar_num_max_solicitudes RETURN parametros.num_max_solicitudes%TYPE;

END pkParametrosNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkParametrosNivel1 AS

    PROCEDURE pinsertar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    ) IS
    BEGIN
        INSERT INTO parametros VALUES (
            ivid,
            ivtiempo_max_pendiente,
            ivnum_max_solicitudes
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'El id esta duplicado');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

    PROCEDURE peliminar (
        ivid parametros.id%TYPE
    ) IS
    BEGIN
        DELETE FROM parametros p
        WHERE
            p.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere eliminar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;

    PROCEDURE pmodificar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    ) IS
    BEGIN
        UPDATE parametros p
        SET
            p.id = ivid,
            p.tiempo_max_pendiente = ivtiempo_max_pendiente,
            p.num_max_solicitudes = ivnum_max_solicitudes
        WHERE
            p.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere modificar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    FUNCTION fconsultar_tiempo_max_pendiente RETURN parametros.tiempo_max_pendiente%TYPE IS
        ovtiempo_max parametros.tiempo_max_pendiente%TYPE;
    BEGIN
        SELECT
            p.tiempo_max_pendiente
        INTO ovtiempo_max
        FROM
            parametros p
        WHERE
            p.id = 1;

        RETURN ovtiempo_max;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere consultar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar_tiempo_max_pendiente;

    FUNCTION fconsultar_num_max_solicitudes RETURN parametros.num_max_solicitudes%TYPE IS
        ovnum_max_solicitudes parametros.num_max_solicitudes%TYPE;
    BEGIN
        SELECT
            p.num_max_solicitudes
        INTO ovnum_max_solicitudes
        FROM
            parametros p
        WHERE
            p.id = 2;

        RETURN ovnum_max_solicitudes;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere consultar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar_num_max_solicitudes;

END pkParametrosNivel1;