-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1536
--   en:        2019-05-23 15:38:54 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE anomalia CASCADE CONSTRAINTS;

DROP TABLE cliente CASCADE CONSTRAINTS;

DROP TABLE contrato CASCADE CONSTRAINTS;

DROP TABLE funcionario CASCADE CONSTRAINTS;

DROP TABLE producto CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE tipo_producto CASCADE CONSTRAINTS;

DROP TABLE tipo_solicitud CASCADE CONSTRAINTS;

CREATE TABLE anomalia (
    id       NVARCHAR2(10) NOT NULL,
    nombre   NVARCHAR2(30) NOT NULL
);

ALTER TABLE anomalia ADD CONSTRAINT anomalia_pk PRIMARY KEY ( id );

CREATE TABLE cliente (
    cedula             NUMBER(11) NOT NULL,
    nombre             NVARCHAR2(30) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    direccion          NVARCHAR2(20) NOT NULL,
    telefono           NVARCHAR2(15) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula );

CREATE TABLE contrato (
    fecha_inicio     DATE NOT NULL,
    fecha_fin        DATE NOT NULL,
    cliente_cedula   NUMBER(11) NOT NULL,
    producto_id      NVARCHAR2(10) NOT NULL
);

CREATE TABLE funcionario (
    cedula             NUMBER(11) NOT NULL,
    nombre             NVARCHAR2(30) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    direccion          NVARCHAR2(20) NOT NULL,
    telefono           NVARCHAR2(15) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( cedula );

CREATE TABLE producto (
    id                     NVARCHAR2(10) NOT NULL,
    nombre                 NVARCHAR2(15) NOT NULL,
    tipo_producto_codigo   NVARCHAR2(15) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id );

CREATE TABLE solicitud (
    numero_solicitud         NUMBER(10) NOT NULL,
    observacion              NVARCHAR2(200),
    fecha_asignacion         DATE NOT NULL,
    fecha_atencion           DATE,
    causa_cancelacion        NVARCHAR2(200),
    comentario_funcionario   NVARCHAR2(200),
    estado                   NVARCHAR2(30) NOT NULL,
    cliente_cedula           NUMBER(11) NOT NULL,
    anomalia_id              NVARCHAR2(10) NOT NULL,
    tipo_solicitud_codigo    NVARCHAR2(15) NOT NULL,
    funcionario_cedula       NUMBER(11) NOT NULL,
    producto_id              NVARCHAR2(10) NOT NULL
);

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( numero_solicitud );

CREATE TABLE tipo_producto (
    codigo        NVARCHAR2(15) NOT NULL,
    nombre        NVARCHAR2(20) NOT NULL,
    descripcion   NVARCHAR2(200) NOT NULL
);

ALTER TABLE tipo_producto ADD CONSTRAINT tipo_producto_pk PRIMARY KEY ( codigo );

CREATE TABLE tipo_solicitud (
    codigo        NVARCHAR2(15) NOT NULL,
    nombre        NVARCHAR2(20) NOT NULL,
    descripcion   NVARCHAR2(200) NOT NULL
);

ALTER TABLE tipo_solicitud ADD CONSTRAINT tipo_solicitud_pk PRIMARY KEY ( codigo );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE producto
    ADD CONSTRAINT producto_tipo_producto_fk FOREIGN KEY ( tipo_producto_codigo )
        REFERENCES tipo_producto ( codigo );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_anomalia_fk FOREIGN KEY ( anomalia_id )
        REFERENCES anomalia ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_cliente_fk FOREIGN KEY ( cliente_cedula )
        REFERENCES cliente ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_funcionario_fk FOREIGN KEY ( funcionario_cedula )
        REFERENCES funcionario ( cedula );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_producto_fk FOREIGN KEY ( producto_id )
        REFERENCES producto ( id );

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_tipo_solicitud_fk FOREIGN KEY ( tipo_solicitud_codigo )
        REFERENCES tipo_solicitud ( codigo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
