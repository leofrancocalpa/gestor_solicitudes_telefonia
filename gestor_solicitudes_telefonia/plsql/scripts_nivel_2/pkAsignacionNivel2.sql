/**
 * Declaración del package de Asignación y sus objetos publicos
 */
CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS 

    /**
        Procedimiento que asigna de forma automatica una solicitud dada a algun funcionario disponible
        @param ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE 
            numero que identifica a la solicitud
        */
	PROCEDURE pAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
	);
	
    /**
        Procedimiento que permite asignar de forma manual e individual una solicitud dada a un funcionario dado
        @param ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
            numero que identifica a la solicitud
        @param ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
            cedula documento de identificacion del funcionario al que se le asignará la solicitud
        */
	PROCEDURE pAsignacionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	);
	
   -- PROCEDURE pAsignacionMasiva ;
    
END pkAsignacionNivel2;
/
CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel2 AS

	PROCEDURE pAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
	) IS
		vCedulaFuncionarioRef FUNCIONARIO.CEDULA%TYPE;
		vCantidadSolicitudesFuncionario NUMBER;
		vTotalFuncionarios NUMBER;
		vParametroMaxSolicitudes PARAMETROS.num_max_solicitudes%TYPE;
		vIndice NUMBER;
	BEGIN
		vIndice:=0;
		SELECT
			COUNT(CEDULA)
		INTO
			vTotalFuncionarios
		FROM
			FUNCIONARIO;
			
		WHILE vIndice < vTotalFuncionarios LOOP
			SELECT
				CEDULA
			INTO
				vCedulaFuncionarioRef
			FROM
				FUNCIONARIO
			WHERE
				ROWNUM=vIndice;
			
			vCantidadSolicitudesFuncionario:= pkSolicitudNivel1.fnumerosolicitudesfuncionario(vCedulaFuncionarioRef);
			vParametroMaxSolicitudes:=pkParametrosNivel1.fconsultarnummaxsolicitudes;
			IF vCantidadSolicitudesFuncionario < vParametroMaxSolicitudes THEN
				pkSolicitudNivel1.pmodificarfuncionario(ivNumeroSolicitud,vCedulaFuncionarioRef);
				vTotalFuncionarios:=0;
			ELSE
				vIndice:=vIndice + 1;
			END IF;
			
		END LOOP;
	
	END pAsignacionAutomatica;	
	
	PROCEDURE pAsignacionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	) IS
		BEGIN
			pkSolicitudNivel1.pmodificarfuncionario(ivNumeroSolicitud,ivCedulaFuncionario);
		EXCEPTION
			WHEN OTHERS THEN
				RAISE_APPLICATION_ERROR(-1,'Error al asignar la solicitud '+ ivNumeroSolicitud +' al Funcionario con cedula '+ivCedulaFuncionario);
				
	END pAsignacionIndividual;
END pkAsignacionNivel2;