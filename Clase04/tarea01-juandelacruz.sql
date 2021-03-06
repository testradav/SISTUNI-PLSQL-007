
CREATE OR REPLACE PACKAGE EDUCA.PKG_DEMO02 AS
	
	PROCEDURE SEL_DINERO
	(
		P_DPROYECTADO OUT DECIMAL,
		P_DRECAUDADO OUT DECIMAL
	);
	
END PKG_DEMO02;


--IMPLEMENTACION DEL PAQUETE: PKG_DEMO02
CREATE OR REPLACE PACKAGE BODY EDUCA.PKG_DEMO02 AS
	
	PROCEDURE SEL_DINERO
	(
		P_DPROYECTADO OUT DECIMAL,
		P_DRECAUDADO OUT DECIMAL
	)
   IS
   
   BEGIN
    SELECT SUM(MAT_PRECIO) INTO P_DPROYECTADO FROM MATRICULA;
    SELECT SUM(PAG_IMPORTE) INTO P_DRECAUDADO FROM PAGO;
	    
   END;
	
END PKG_DEMO02;





BEGIN
  EDUCA.PKG_DEMO02.SEL_DINERO (:p_dproyectado$DECIMAL, :p_drecaudado$DECIMAL);
END;
