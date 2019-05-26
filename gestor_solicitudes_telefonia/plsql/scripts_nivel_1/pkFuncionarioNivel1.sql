CREATE OR REPLACE PACKAGE pkFuncionarioNivel1 AS
    PROCEDURE pinsertar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    );

    PROCEDURE peliminar (
        ivcedula funcionario.cedula%TYPE
    );

    PROCEDURE pmodificar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    );

    FUNCTION fconsultar (
        ivcedula funcionario.cedula%TYPE
    ) RETURN funcionario%rowtype;

END pkFuncionarioNivel1;
/

CREATE OR REPLACE PACKAGE BODY pkFuncionarioNivel1 AS 
-- Insertar

    PROCEDURE pinsertar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    ) IS
    BEGIN
        INSERT INTO funcionario VALUES (
            ivcedula,
            ivnombre,
            ivfecha_nacimiento,
            ivdireccion,
            ivtelefono
        );

    EXCEPTION
        WHEN dup_val_on_index THEN
            raise_application_error(-20001, 'Error, este registro ya existe.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END pinsertar;

  --Eliminar

    PROCEDURE peliminar (
        ivcedula funcionario.cedula%TYPE
    ) IS
    BEGIN
        DELETE FROM funcionario f
        WHERE
            f.cedula = ivcedula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'Error, no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END peliminar;
  
    -- Actualizar

    PROCEDURE pmodificar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    ) IS
    BEGIN
        UPDATE funcionario f
        SET
            f.cedula = ivcedula,
            f.nombre = ivnombre,
            f.fecha_nacimiento = ivfecha_nacimiento,
            f.direccion = ivdireccion,
            f.telefono = ivtelefono
        WHERE
            f.cedula = ivcedula;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'Error,  no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END pmodificar;

    --OBTENER

    FUNCTION fconsultar (
        ivcedula funcionario.cedula%TYPE
    ) RETURN funcionario%rowtype IS
        rowfuncionario funcionario%rowtype;
    BEGIN
        SELECT
            *
        INTO rowfuncionario
        FROM
            funcionario f
        WHERE
            f.cedula = ivcedula;

        RETURN rowfuncionario;
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20001, 'Error, no existe un funcionario con ese n�mero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-20001, 'Error desconocido.'
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

END pkFuncionarioNivel1;