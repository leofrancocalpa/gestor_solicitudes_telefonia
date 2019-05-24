CREATE OR REPLACE PACKAGE pk_cliente_1 AS
    PROCEDURE pInsertar (
        cedula             cliente.cedula%TYPE,
        nombre             cliente.nombre%TYPE,
        fecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        direccion          cliente.direccion%TYPE,
        telefono           cliente.telefono%TYPE
    );

    PROCEDURE pModificar (
        cedula             cliente.cedula%TYPE,
        nombre             cliente.nombre%TYPE,
        fecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        direccion          cliente.direccion%TYPE,
        telefono           cliente.telefono%TYPE
    );

    PROCEDURE pEliminar (
        cedula cliente.cedula%TYPE
    );

    FUNCTION fConsultar (
        cedula cliente.cedula%TYPE
    ) RETURN cliente%rowtype;

END pk_cliente_1;
/

CREATE OR REPLACE PACKAGE BODY pk_cliente_1 AS

    PROCEDURE pInsertar (
        cedula             cliente.cedula%TYPE,
        nombre             cliente.nombre%TYPE,
        fecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        direccion          cliente.direccion%TYPE,
        telefono           cliente.telefono%TYPE
    ) IS
    BEGIN
        INSERT INTO cliente VALUES (
            cedula,
            nombre,
            fecha_nacimiento,
            direccion,
            telefono
        );

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-2001, 'El programa intent� insertar valores duplicados en una columna que est� restringida por un �ndice �nico'
            );
    END pInsertar;

    PROCEDURE pModificar (
        cedula             cliente.cedula%TYPE,
        nombre             cliente.nombre%TYPE,
        fecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        direccion          cliente.direccion%TYPE,
        telefono           cliente.telefono%TYPE
    ) IS
    BEGIN
        UPDATE cliente c
        SET
            c.nombre = nombre,
            c.fecha_nacimiento = fecha_nacimiento,
            c.direccion = direccion,
            c.telefono = telefono
        WHERE
            c.cedula = cedula;

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-2001, 'El programa intent� insertar valores duplicados en una columna que est� restringida por un �ndice �nico'
            );
    END pModificar;

    PROCEDURE pEliminar (
        cedula cliente.cedula%TYPE
    ) IS
    BEGIN
        DELETE FROM cliente c
        WHERE
            c.cedula = cedula;

    END pEliminar;

    FUNCTION fConsultar (
        cedula cliente.cedula%TYPE
    ) RETURN cliente%rowtype IS
        rowcliente cliente%rowtype;
    BEGIN
        SELECT
            *
        INTO rowcliente
        FROM
            cliente c
        WHERE
            c.cedula = cedula;

        RETURN rowcliente;
    EXCEPTION
        WHEN too_many_rows OR invalid_number THEN
            raise_application_error(-2001, 'Numero invalido o regresa mas de 1 tupla');
    END fConsultar;

END pk_cliente_1;