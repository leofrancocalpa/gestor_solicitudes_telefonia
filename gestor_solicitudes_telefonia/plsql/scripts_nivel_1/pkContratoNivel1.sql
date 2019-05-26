CREATE OR REPLACE PACKAGE pkContratoNivel1 AS
    PROCEDURE pinsertar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    );

    PROCEDURE peliminar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE
    );

    PROCEDURE pmodificarfechainicio (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE
    );

    PROCEDURE pmodificarfechafin (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    );

    FUNCTION fconsultar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE
    ) RETURN contrato%rowtype;

END pkContratoNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkContratoNivel1 AS

    PROCEDURE pinsertar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    ) IS
    BEGIN
        INSERT INTO contrato VALUES (
            ivfecha_inicio,
            ivfecha_fin,
            ivcliente_cedula,
            ivproducto_id
        );

    END pinsertar;

    PROCEDURE peliminar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE
    ) IS
    BEGIN
        DELETE FROM contrato c
        WHERE
            c.cliente_cedula = ivcliente_cedula
            AND c.producto_id = ivproducto_id;

    END peliminar;

    PROCEDURE pmodificarfechainicio (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE
    ) IS
    BEGIN
        UPDATE contrato c
        SET
            c.fecha_inicio = ivfecha_inicio
        WHERE
            c.cliente_cedula = ivcliente_cedula
            AND c.producto_id = ivproducto_id;

    END pmodificarfechainicio;

    PROCEDURE pmodificarfechafin (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    ) IS
    BEGIN
        UPDATE contrato c
        SET
            c.fecha_fin = ivfecha_fin
        WHERE
            c.cliente_cedula = ivcliente_cedula
            AND c.producto_id = ivproducto_id;

    END pmodificarfechafin;

    FUNCTION fconsultar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE
    ) RETURN contrato%rowtype IS
        rowcontrato contrato%rowtype;
    BEGIN
        SELECT
            *
        INTO rowcontrato
        FROM
            contrato c
        WHERE
            c.cliente_cedula = ivcliente_cedula
            AND c.producto_id = ivproducto_id;

        RETURN rowcontrato;
    END fconsultar;

END pkContratoNivel1;