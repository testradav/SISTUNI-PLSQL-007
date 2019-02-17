CREATE OR REPLACE PACKAGE EDUCA.PKG_DEMO02 AS
    
    PROCEDURE PR_OBTIENEDINERO;
    
END PKG_DEMO02;

CREATE OR REPLACE PACKAGE BODY EDUCA.PKG_DEMO02 AS
    PROCEDURE PR_OBTIENEDINERO
    AS
        DPROYECTADO NUMBER(10,2);
        DRECAUDADO NUMBER(10,2);
    BEGIN
    
        SELECT 
        SUM(MAT_PRECIO)
        INTO DPROYECTADO
        FROM EDUCA.MATRICULA; 
        
        SELECT 
        SUM(PAG_IMPORTE)
        INTO DRECAUDADO
        FROM EDUCA.PAGO;
        
        dbms_output.put_line('Dinero proyectado: ' || DPROYECTADO || CHR(13)||CHR(10) || 'Dinero recaudado: ' || DRECAUDADO);
        
    END PR_OBTIENEDINERO;
END PKG_DEMO02;
BEGIN
    EDUCA.PKG_DEMO02.PR_OBTIENEDINERO();
END;
