CREATE OR REPLACE PACKAGE pk_anomalia_1 AS
    PROCEDURE pinsertar (
        nombre   anomalia.nombre%TYPE,
        id       anomalia.id%TYPE
    );

    PROCEDURE pmodificar (
        nombre   anomalia.nombre%TYPE,
        id       anomalia.id%TYPE
    );

    PROCEDURE peliminar (
        id anomalia.id%TYPE
    );

    FUNCTION fconsultar (
        id anomalia.id%TYPE
    ) RETURN anomalia%rowtype;

END pk_anomalia_1;
/

CREATE OR REPLACE PACKAGE BODY pk_anomalia_1 AS

    PROCEDURE pinsertar (
        nombre   anomalia.nombre%TYPE,
        id       anomalia.id%TYPE
    ) IS
    BEGIN
        INSERT INTO anomalia VALUES (
            id,
            nombre
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'El id esta duplicado.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

    PROCEDURE pmodificar (
        nombre   anomalia.nombre%TYPE,
        id       anomalia.id%TYPE
    ) IS
    BEGIN
        UPDATE anomalia a
        SET
            a.nombre = nombre
        WHERE
            a.id = id;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere modificar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    PROCEDURE peliminar (
        id anomalia.id%TYPE
    ) IS
    BEGIN
        DELETE FROM anomalia
        WHERE
            anomalia.id = id;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere eliminar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;

    FUNCTION fconsultar (
        id anomalia.id%TYPE
    ) RETURN anomalia%rowtype IS
        rowanomalia anomalia%rowtype;
    BEGIN
        SELECT
            *
        INTO rowanomalia
        FROM
            anomalia
        WHERE
            anomalia.id = id;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere modificar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

END pk_anomalia_1;