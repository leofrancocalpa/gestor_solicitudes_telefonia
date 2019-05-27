CREATE OR REPLACE PACKAGE pkParametrosNivel1 AS

    /**
        proceso que inserta un registro en la tabla parametros con los parametros dados
        @param ivid                     parametros.id%TYPE
        @param ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE
        @param ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
        */
    PROCEDURE pinsertar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    );

    /**
        proceso que elimina un registro en la tabla parametros. Se busca el registro por el id
        @param ivid parametros.id%TYPE
        */
    PROCEDURE peliminar (
        ivid parametros.id%TYPE
    );

    /**
        proceso que modifica un registro de la tabla parametros  con los parametros dados
        @param ivid                     parametros.id%TYPE
        @param ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE
        @param ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
        */
    PROCEDURE pmodificar (
        ivid                     parametros.id%TYPE,
        ivtiempo_max_pendiente   parametros.tiempo_max_pendiente%TYPE,
        ivnum_max_solicitudes    parametros.num_max_solicitudes%TYPE
    );

    /**
    funcion que retorna la contante de tiempo maximo en estado pendiente de una solicitud
    */
    FUNCTION fconsultartiempomaxpendiente RETURN parametros.tiempo_max_pendiente%TYPE;
    
    /**
    funcion que retorna la constante de el numero maximo de solicitudes que puede tener asignadas un funcionario
    */
    FUNCTION fconsultarnummaxsolicitudes RETURN parametros.num_max_solicitudes%TYPE;

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
            raise_application_error(-1, 'El id esta duplicado');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
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
            raise_application_error(-1, 'El ID que se quiere eliminar no existe');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
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
            raise_application_error(-1, 'El ID que se quiere modificar no existe');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    FUNCTION fconsultartiempomaxpendiente RETURN parametros.tiempo_max_pendiente%TYPE IS
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
            raise_application_error(-1, 'El ID que se quiere consultar no existe');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultartiempomaxpendiente;

    FUNCTION fconsultarnummaxsolicitudes RETURN parametros.num_max_solicitudes%TYPE IS
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
            raise_application_error(-1, 'El ID que se quiere consultar no existe');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultarnummaxsolicitudes;

END pkParametrosNivel1;