CREATE OR REPLACE TRIGGER triggerAsignacionAutomatica
    AFTER
        INSERT ON SOLICITUD
            FOR EACH ROW
    BEGIN
        pkAsignacionNivel2.pAsignacionAutomatica(:NEW.NUMERO_SOLICITUD);
END triggerAsignacionAutomatica;       