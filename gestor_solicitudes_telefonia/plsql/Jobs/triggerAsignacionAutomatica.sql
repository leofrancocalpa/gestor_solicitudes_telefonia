CREATE TRIGGER triggerAsignacionAutomatica
    AFTER
        INSERT ON SOLICITUD
            FOR EACH ROW
    BEGIN
        pkAsignacionNivel3.fAsignacionAutomatica(:NEW.id);
END triggerAsignacionAutomatica;       