CREATE OR REPLACE PACKAGE pkAsignacionNivel3 AS

    FUNCTION fAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
	)
        RETURN VARCHAR2;
	
	FUNCTION fAsignacionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	)
        RETURN VARCHAR2;


END pkAsignacionNivel3;
/

CREATE OR REPLACE PACKAGE BODY pkAsignacionNivel3 AS

    FUNCTION fAsignacionAutomatica(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE
    )
        RETURN VARCHAR2 IS
            BEGIN
                pkAsignacionNivel2.pAsignacionAutomatica(
                  ivNumeroSolicitud  
                );
                    RETURN 'Asignado';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;
    END fAsignacionAutomatica;
    
    FUNCTION fAsignacionIndividual(
		ivNumeroSolicitud IN SOLICITUD.NUMERO_SOLICITUD%TYPE,
		ivCedulaFuncionario IN FUNCIONARIO.CEDULA%TYPE
	)
        RETURN VARCHAR2 IS
            BEGIN
                pkAsignacionNivel2.pAsignacionIndividual(
                    ivNumeroSolicitud,
                    ivCedulaFuncionario
                );
                    RETURN 'Asignado';
            EXCEPTION
                WHEN OTHERS THEN
                    RETURN sqlerrm;
    END fAsignacionIndividual;
    
END pkAsignacionNivel3;