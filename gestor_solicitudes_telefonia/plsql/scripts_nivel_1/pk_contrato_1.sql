CREATE OR REPLACE PACKAGE pk_contrato_1 AS
    PROCEDURE pinsertar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_inicio     contrato.fecha_inicio%TYPE,
        fecha_fin        contrato.fecha_fin%TYPE
    );

    PROCEDURE peliminar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE
    );

    PROCEDURE pmodificarfechainicio (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_inicio     contrato.fecha_inicio%TYPE
    );

    PROCEDURE pmodificarfechafin (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_fin        contrato.fecha_fin%TYPE
    );

    FUNCTION fconsultar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE
    ) RETURN contrato%rowtype;

END pk_contrato_1;
/

CREATE OR REPLACE PACKAGE BODY pk_contrato_1 AS

    PROCEDURE pinsertar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_inicio     contrato.fecha_inicio%TYPE,
        fecha_fin        contrato.fecha_fin%TYPE
    ) IS
    BEGIN
        INSERT INTO contrato VALUES (
            fecha_inicio,
            fecha_fin,
            cliente_cedula,
            producto_id
        );

    END pinsertar;

    PROCEDURE peliminar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE
    ) IS
    BEGIN
        DELETE FROM contrato c
        WHERE
            c.cliente_cedula = cliente_cedula
            AND c.producto_id = producto_id;

    END peliminar;

    PROCEDURE pmodificarfechainicio (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_inicio     contrato.fecha_inicio%TYPE
    ) IS
    BEGIN
        UPDATE contrato c
        SET
            c.fecha_inicio = fecha_inicio
        WHERE
            c.cliente_cedula = cliente_cedula
            AND c.producto_id = producto_id;

    END pmodificarfechainicio;

    PROCEDURE pmodificarfechafin (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE,
        fecha_fin        contrato.fecha_fin%TYPE
    ) IS
    BEGIN
        UPDATE contrato c
        SET
            c.fecha_fin = fecha_fin
        WHERE
            c.cliente_cedula = cliente_cedula
            AND c.producto_id = producto_id;

    END pmodificarfechafin;

    FUNCTION fconsultar (
        cliente_cedula   contrato.cliente_cedula%TYPE,
        producto_id      contrato.producto_id%TYPE
    ) RETURN contrato%rowtype IS
        rowcontrato contrato%rowtype;
    BEGIN
        SELECT
            *
        INTO rowcontrato
        FROM
            contrato c
        WHERE
            c.cliente_cedula = cliente_cedula
            AND c.producto_id = producto_id;

        RETURN rowcontrato;
    END fconsultar;

END pk_contrato_1;