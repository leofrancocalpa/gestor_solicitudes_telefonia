CREATE OR REPLACE PACKAGE pkTipoProductoNivel1 AS
    PROCEDURE pinsertar (
        ivcodigo        tipo_producto.codigo%TYPE,
        ivnombre        tipo_producto.nombre%TYPE,
        ivdescripcion   tipo_producto.descripcion%TYPE
    );

    PROCEDURE peliminar (
        ivcodigo tipo_producto.codigo%TYPE
    );

    PROCEDURE pmodificar (
        ivcodigo        tipo_producto.codigo%TYPE,
        ivnombre        tipo_producto.nombre%TYPE,
        ivdescripcion   tipo_producto.descripcion%TYPE
    );

    FUNCTION fconsultar (
        ivcodigo tipo_producto.codigo%TYPE
    ) RETURN tipo_producto%rowtype;

END pkTipoProductoNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkTipoProductoNivel1 AS

    PROCEDURE pinsertar (
        ivcodigo        tipo_producto.codigo%TYPE,
        ivnombre        tipo_producto.nombre%TYPE,
        ivdescripcion   tipo_producto.descripcion%TYPE
    ) IS
    BEGIN
        INSERT INTO tipo_producto VALUES (
            ivcodigo,
            ivnombre,
            ivdescripcion
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'El id esta duplicado');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

    PROCEDURE peliminar (
        ivcodigo tipo_producto.codigo%TYPE
    ) IS
    BEGIN
        DELETE FROM tipo_producto tp
        WHERE
            tp.codigo = ivcodigo;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere eliminar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;

    PROCEDURE pmodificar (
        ivcodigo        tipo_producto.codigo%TYPE,
        ivnombre        tipo_producto.nombre%TYPE,
        ivdescripcion   tipo_producto.descripcion%TYPE
    ) IS
    BEGIN
        UPDATE tipo_producto tp
        SET
            tp.nombre = ivnombre,
            tp.descripcion = ivdescripcion
        WHERE
            tp.codigo = ivcodigo;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere modificar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    FUNCTION fconsultar (
        ivcodigo tipo_producto.codigo%TYPE
    ) RETURN tipo_producto%rowtype IS
        rowtp tipo_producto%rowtype;
    BEGIN
        SELECT
            *
        INTO rowtp
        FROM
            tipo_producto tp
        WHERE
            tp.codigo = ivcodigo;

        RETURN rowtp;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El ID que se quiere consultar no existe');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

END pkTipoProductoNivel1;