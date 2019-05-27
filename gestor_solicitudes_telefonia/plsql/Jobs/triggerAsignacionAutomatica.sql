/**
DEclaracion de TRigger para asignacion automatica de una solicitud a un funcionario al ser creada
*/
CREATE OR REPLACE TRIGGER triggerAsignacionAutomatica
    AFTER
        INSERT ON SOLICITUD
            FOR EACH ROW
    BEGIN
        pkAsignacionNivel2.pAsignacionAutomatica(:NEW.NUMERO_SOLICITUD);
END triggerAsignacionAutomatica;       