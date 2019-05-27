CREATE OR REPLACE PACKAGE pkFuncionarioNivel1 AS

    /**
        Proceso que inserta un registro en la tabla funcionario nivel
        @param ivcedula             funcionario.cedula%TYPE
        @param ivnombre             funcionario.nombre%TYPE
        @param ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE
        @param ivdireccion          funcionario.direccion%TYPE
        @param ivtelefono           funcionario.telefono%TYPE
        */
    PROCEDURE pinsertar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    );

    /**
        proceso que elimina un registro de la tabla funcionario. Busca el registro con el parametro dado
        @param ivcedula funcionario.cedula%TYPE
        */
    PROCEDURE peliminar (
        ivcedula funcionario.cedula%TYPE
    );

    /**
        modifica un ragistro de funcionario con los parametros de entrada. EL registro se busca con la cedula del funcionario
        @param ivcedula             funcionario.cedula%TYPE
        @param ivnombre             funcionario.nombre%TYPE
        @param ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE
        @param ivdireccion          funcionario.direccion%TYPE
        @param ivtelefono           funcionario.telefono%TYPE
        */
    PROCEDURE pmodificar (
        ivcedula             funcionario.cedula%TYPE,
        ivnombre             funcionario.nombre%TYPE,
        ivfecha_nacimiento   funcionario.fecha_nacimiento%TYPE,
        ivdireccion          funcionario.direccion%TYPE,
        ivtelefono           funcionario.telefono%TYPE
    );

    /**
        funcion que consulta un registro de la tabla funcionario
        @param ivcedula funcionario.cedula%TYPE
        @return 
        */
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
            raise_application_error(-1, 'Error, este registro ya existe.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
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
            raise_application_error(-1, 'Error, no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
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
            raise_application_error(-1, 'Error,  no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
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
            raise_application_error(-1, 'Error, no existe un funcionario con ese numero de cedula.');
        WHEN OTHERS THEN
            raise_application_error(-1, 'Error '
                                            || sqlerrm
                                            || sqlcode);
    END fconsultar;

END pkFuncionarioNivel1;