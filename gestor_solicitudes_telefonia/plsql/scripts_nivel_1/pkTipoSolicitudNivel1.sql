CREATE OR REPLACE PACKAGE pkTipoSolicitudNivel1 IS
    /**
        
        @param ivcodigo        tipo_solicitud.codigo%TYPE
        @param ivnombre        tipo_solicitud.nombre%TYPE
        @param ivdescripcion   tipo_solicitud.descripcion%TYPE
        */
    PROCEDURE pinsertar (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    );

    /**
        proceso que elimina un registro de la tabla tipo solicitud
        @param ivcodigo tipo_solicitud.codigo%TYPE
        */
    PROCEDURE pEliminarTipoSolicitud (
        ivcodigo tipo_solicitud.codigo%TYPE
    );

    /**
        proceso que modifica el registro de una solicitud dada con los parametros de entrada
        @param ivcodigo        tipo_solicitud.codigo%TYPE
        @param ivnombre        tipo_solicitud.nombre%TYPE
        @param ivdescripcion   tipo_solicitud.descripcion%TYPE
        */
    PROCEDURE pModificarTipoSolicitud (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    );

    /**
        funcion que retorna un registro de la tabla tipo solicitud
        @param ivcodigo tipo_solicitud.codigo%TYPE
        @return 
        */
    FUNCTION fConsultar (
        ivcodigo tipo_solicitud.codigo%TYPE
    ) RETURN tipo_solicitud%rowtype;

END pkTipoSolicitudNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkTipoSolicitudNivel1 AS

    PROCEDURE pinsertar (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    ) IS
    BEGIN
        INSERT INTO tipo_solicitud VALUES (
            ivcodigo,
            ivnombre,
            ivdescripcion
        );

    END pinsertar;

    PROCEDURE pEliminarTipoSolicitud (
        ivcodigo tipo_solicitud.codigo%TYPE
    ) IS
    BEGIN
        DELETE FROM tipo_solicitud t
        WHERE
            t.codigo = ivcodigo;

    END pEliminarTipoSolicitud;

    PROCEDURE pModificarTipoSolicitud (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    ) IS
    BEGIN
        UPDATE tipo_solicitud t
        SET
            t.nombre = ivnombre,
            t.descripcion = ivdescripcion
        WHERE
            t.codigo = ivcodigo;

    END pModificarTipoSolicitud;

    FUNCTION fConsultar (
        ivcodigo        tipo_solicitud.codigo%TYPE
    ) RETURN tipo_solicitud%rowtype IS
        rowtiposolicitud tipo_solicitud%rowtype;
    BEGIN
        SELECT
            *
        INTO rowtiposolicitud
        FROM
            tipo_solicitud t
        WHERE
            t.codigo = ivcodigo;

        RETURN rowtiposolicitud;
    END fConsultar;

END pkTipoSolicitudNivel1;