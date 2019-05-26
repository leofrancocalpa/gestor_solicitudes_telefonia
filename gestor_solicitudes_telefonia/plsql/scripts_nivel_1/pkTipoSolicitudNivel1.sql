CREATE OR REPLACE PACKAGE pkTipoSolicitudNivel1 IS
    PROCEDURE pinsertar (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    );

    PROCEDURE pEliminarTipoSolicitud (
        ivcodigo tipo_solicitud.codigo%TYPE
    );

    PROCEDURE pModificarTipoSolicitud (
        ivcodigo        tipo_solicitud.codigo%TYPE,
        ivnombre        tipo_solicitud.nombre%TYPE,
        ivdescripcion   tipo_solicitud.descripcion%TYPE
    );

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