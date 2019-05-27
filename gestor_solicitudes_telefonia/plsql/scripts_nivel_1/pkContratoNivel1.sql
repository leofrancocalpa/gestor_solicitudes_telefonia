CREATE OR REPLACE PACKAGE pkContratoNivel1 AS
    /**
        Procedimiento que inserta un registro en la tabla contrato
        @param ivcliente_cedula   contrato.cliente_cedula%TYPE
        @param ivproducto_id      contrato.producto_id%TYPE
        @param ivfecha_inicio     contrato.fecha_inicio%TYPE
        @param ivfecha_fin        contrato.fecha_fin%TYPE
        */
    PROCEDURE pinsertar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    );

    /**
        procedimiento que elimina un registro de la tabla contrato, busca el registro por cedula de cliente y id de producto
        @param ivcliente_cedula   contrato.cliente_cedula%TYPE
        @param ivproducto_id      contrato.producto_id%TYPE
        */
    PROCEDURE peliminar (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE
    );

    /**
        Procedimiento que modifica un registro de la tabla contrato
        @param ivcliente_cedula   contrato.cliente_cedula%TYPE
        @param ivproducto_id      contrato.producto_id%TYPE
        @param ivfecha_inicio     contrato.fecha_inicio%TYPE
        */
    PROCEDURE pmodificarfechainicio (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_inicio     contrato.fecha_inicio%TYPE
    );

    /**
        procedimiento que modifica la fecha fin de un contrato  con los parametros de busqueda dados
        @param ivcliente_cedula   contrato.cliente_cedula%TYPE
        @param ivproducto_id      contrato.producto_id%TYPE
        @param ivfecha_fin        contrato.fecha_fin%TYPE
        */ 
    PROCEDURE pmodificarfechafin (
        ivcliente_cedula   contrato.cliente_cedula%TYPE,
        ivproducto_id      contrato.producto_id%TYPE,
        ivfecha_fin        contrato.fecha_fin%TYPE
    );

    /**
        Funcion que consulta un registro de la tabla contrato con los parametros de busqueda dados
        @param ivcliente_cedula   contrato.cliente_cedula%TYPE
        @param ivproducto_id      contrato.producto_id%TYPE
        @return 
        */
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