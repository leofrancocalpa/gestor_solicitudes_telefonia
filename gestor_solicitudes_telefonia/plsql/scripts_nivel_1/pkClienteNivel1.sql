CREATE OR REPLACE PACKAGE pkClienteNivel1 AS
    /**
        Procedimiento que inserta un registro en la tablacliente
        @param ivcedula             cliente.cedula%TYPE
        @param ivnombre             cliente.nombre%TYPE
        @param ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE
        @param ivdireccion          cliente.direccion%TYPE
        @param ivtelefono           cliente.telefono%TYPE
        */
    PROCEDURE pInsertar (
        ivcedula             cliente.cedula%TYPE,
        ivnombre             cliente.nombre%TYPE,
        ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        ivdireccion          cliente.direccion%TYPE,
        ivtelefono           cliente.telefono%TYPE
    );

    /**
        Procedimiento que modifica un registro de en la tabla cliente. Busca el registro por la cedula del clinete
        @param ivcedula             cliente.cedula%TYPE
        @param ivnombre             cliente.nombre%TYPE
        @param ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE
        @param ivdireccion          cliente.direccion%TYPE
        @param ivtelefono           cliente.telefono%TYPE
        */
    PROCEDURE pModificar (
        ivcedula             cliente.cedula%TYPE,
        ivnombre             cliente.nombre%TYPE,
        ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        ivdireccion          cliente.direccion%TYPE,
        ivtelefono           cliente.telefono%TYPE
    );

    /**
        procedimiento que elimina un registro de la tabla cliente. Busca el registro con la cedula del cliente
        @param ivcedula cliente.cedula%TYPE
        */
    PROCEDURE pEliminar (
        ivcedula cliente.cedula%TYPE
    );

    /**
        Funcion que retorna la consulta de un registro de la clase cliente, el cual se busca por la cedula del cliente
        @param ivcedula cliente.cedula%TYPE
        @return 
        */
    FUNCTION fConsultar (
        ivcedula cliente.cedula%TYPE
    ) RETURN cliente%rowtype;

END pkClienteNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkClienteNivel1 AS

    PROCEDURE pInsertar (
        ivcedula             cliente.cedula%TYPE,
        ivnombre             cliente.nombre%TYPE,
        ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        ivdireccion          cliente.direccion%TYPE,
        ivtelefono           cliente.telefono%TYPE
    ) IS
    BEGIN
        INSERT INTO cliente VALUES (
            ivcedula,
            ivnombre,
            ivfecha_nacimiento,
            ivdireccion,
            ivtelefono
        );

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-1, 'El programa intento insertar valores duplicados en una columna que esta restringida por un �ndice �nico'
            );
    END pInsertar;

    PROCEDURE pModificar (
        ivcedula             cliente.cedula%TYPE,
        ivnombre             cliente.nombre%TYPE,
        ivfecha_nacimiento   cliente.fecha_nacimiento%TYPE,
        ivdireccion          cliente.direccion%TYPE,
        ivtelefono           cliente.telefono%TYPE
    ) IS
    BEGIN
        UPDATE cliente c
        SET
            c.nombre = ivnombre,
            c.fecha_nacimiento = ivfecha_nacimiento,
            c.direccion = ivdireccion,
            c.telefono = ivtelefono
        WHERE
            c.cedula = ivcedula;

    EXCEPTION
        WHEN OTHERS THEN
            raise_application_error(-1, 'El programa intento insertar valores duplicados en una columna que esta restringida por un �ndice �nico'
            );
    END pModificar;

    PROCEDURE pEliminar (
        ivcedula cliente.cedula%TYPE
    ) IS
    BEGIN
        DELETE FROM cliente c
        WHERE
            c.cedula = ivcedula;

    END pEliminar;

    FUNCTION fConsultar (
        ivcedula cliente.cedula%TYPE
    ) RETURN cliente%rowtype IS
        rowcliente cliente%rowtype;
    BEGIN
        SELECT
            *
        INTO rowcliente
        FROM
            cliente c
        WHERE
            c.cedula = ivcedula;

        RETURN rowcliente;
    EXCEPTION
        WHEN too_many_rows OR invalid_number THEN
            raise_application_error(-1, 'Numero invalido o regresa mas de 1 tupla');
    END fConsultar;

END pkClienteNivel1;