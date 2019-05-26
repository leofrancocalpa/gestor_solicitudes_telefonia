CREATE OR REPLACE PACKAGE pkProductoNivel1 AS
    PROCEDURE pinsertar (
        ivid                     producto.id%TYPE,
        ivnombre                 producto.nombre%TYPE,
        ivtipo_producto_codigo   producto.tipo_producto_codigo%TYPE
    );

    PROCEDURE peliminar (
        ivid producto.id%TYPE
    );

    FUNCTION fconsultar (
        ivid producto.id%TYPE
    ) RETURN producto%rowtype;

    PROCEDURE pmodificar (
        ivid                     producto.id%TYPE,
        ivnombre                 producto.nombre%TYPE,
        ivtipo_producto_codigo   producto.tipo_producto_codigo%TYPE
    );

END pkProductoNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkProductoNivel1 AS

    PROCEDURE pinsertar (
        ivid                     producto.id%TYPE,
        ivnombre                 producto.nombre%TYPE,
        ivtipo_producto_codigo   producto.tipo_producto_codigo%TYPE
    ) IS
    BEGIN
        INSERT INTO producto VALUES (
            ivid,
            ivnombre,
            ivtipo_producto_codigo
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'El id esta duplicado.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'ERROR'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

    PROCEDURE peliminar (
        ivid producto.id%TYPE
    ) IS
    BEGIN
        DELETE FROM producto
        WHERE
            producto.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El id a eliminar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'ERROR'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;

    FUNCTION fconsultar (
        ivid producto.id%TYPE
    ) RETURN producto%rowtype IS
        rowproducto producto%rowtype;
    BEGIN
        SELECT
            *
        INTO rowproducto
        FROM
            producto
        WHERE
            producto.id = ivid;

        RETURN rowproducto;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El id a consultar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'ERROR'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

    PROCEDURE pmodificar (
        ivid                     producto.id%TYPE,
        ivnombre                 producto.nombre%TYPE,
        ivtipo_producto_codigo   producto.tipo_producto_codigo%TYPE
    ) IS
    BEGIN
        UPDATE producto p
        SET
            p.nombre = ivnombre,
            p.tipo_producto_codigo = ivtipo_producto_codigo
        WHERE
            p.id = ivid;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'El producto a consultar no existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'ERROR'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

END pkProductoNivel1;