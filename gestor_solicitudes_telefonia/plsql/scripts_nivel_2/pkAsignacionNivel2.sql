CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS 
	
	PROCEDURE pAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
	);
	
	PROCEDURE pAsignacionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	);
	
END pkAsignacionNivel2;

CREATE OR REPLACE PACKAGE pkAsignacionNivel2 AS

	PROCEDURE pAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
	) IS
		vCedulaFuncionarioRef FUNCIONARIO.CEDULA%TYPE;
		vCantidadSolicitudesFuncionario NUMBER;
		vTotalFuncionarios NUMBER;
		vParametro NUMBER;
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
			
			vCantidadSolicitudesFuncionario:= pkSolicitudNivel1.fDarSolicitudes(vCedulaFuncionarioRef);
			vParamatro:=pkParametroNivel1.fConsultar(1).NUMEROSOLICITUDESFUNCIONARIO;
			IF vCantidadSolicitudesFuncionario < vParametro THEN<
				pkSolicitudNivel1.pModificarSolicitudAsignacion(ivNumeroSolicitud,vCedulaFuncionarioRef);
				vTotalFuncionarios:=0;
			ELSE
				vIndice:=vIndice + 1;
			END IF;
			
		END LOOP;
	
	END pAsignacionAutomatica;	
	
	PROCEDURE pAsigancionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	) IS
		BEGIN
			pkSolicitudNivel1.pModificarSolicitudAsignacion(ivNumeroSolicitud,ivCedulaFuncionario);
		EXCEPTION
			WHEN OTHERS THEN
				RAISE_APPLICATION_ERROR(-1,'Error al asignar la solicitud 'ivNumeroSolicitud ' al Funcionario con cedula 'ivCedulaFuncionario);
				
	END pAsignacionAutomatica;
END pkAsignacionNivel2;