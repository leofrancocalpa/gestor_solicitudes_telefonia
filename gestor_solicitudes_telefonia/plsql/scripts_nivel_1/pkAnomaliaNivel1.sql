CREATE OR REPLACE PACKAGE pkAnomaliaNivel1 AS
    /**
        Procedimiento que inserta un registro en la tabla anomalia
        @param ivnombre   anomalia.nombre%TYPE
        @param ivid       anomalia.id%TYPE
        */
    PROCEDURE pinsertar (
        ivnombre   anomalia.nombre%TYPE,
        ivid       anomalia.id%TYPE
    );
    
    /**
        Procedimiento que modifica un registro de la tabla anomalia. Busca el registro por el ID
        @param ivnombre   anomalia.nombre%TYPE
        @param ivid       anomalia.id%TYPE
        */
    PROCEDURE pmodificar (
        ivnombre   anomalia.nombre%TYPE,
        ivid       anomalia.id%TYPE
    );
    
    /**
        Procedimiento que elimina un registro de la tabla anomalia. Busca el registro por el codigo
        @param ivid anomalia.id%TYPE
        */
    PROCEDURE peliminar (
        ivid anomalia.id%TYPE
    );

    /**
        funcion que busca un registro por el id de anomalia
        @param ivid anomalia.id%TYPE
        @return registro de la tabla anomalia
        */
    FUNCTION fconsultar (
        ivid anomalia.id%TYPE
    ) RETURN anomalia%rowtype;

END pkAnomaliaNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkAnomaliaNivel1 AS

    PROCEDURE pinsertar (
        ivnombre   anomalia.nombre%TYPE,
        ivid       anomalia.id%TYPE
    ) IS
    BEGIN
        INSERT INTO anomalia VALUES (
            ivid,
            ivnombre
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-1, 'El id esta duplicado.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

    PROCEDURE pmodificar (
        ivnombre   anomalia.nombre%TYPE,
        ivid       anomalia.id%TYPE
    ) IS
    BEGIN
        UPDATE anomalia a
        SET
            a.nombre = ivnombre
        WHERE
            a.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'El ID que se quiere modificar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    PROCEDURE peliminar (
        ivid anomalia.id%TYPE
    ) IS
    BEGIN
        DELETE FROM anomalia
        WHERE
            anomalia.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'El ID que se quiere eliminar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;

    FUNCTION fconsultar (
        ivid anomalia.id%TYPE
    ) RETURN anomalia%rowtype IS
        rowanomalia anomalia%rowtype;
    BEGIN
        SELECT
            *
        INTO rowanomalia
        FROM
            anomalia
        WHERE
            anomalia.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-1, 'El ID que se quiere modificar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

END pkAnomaliaNivel1;