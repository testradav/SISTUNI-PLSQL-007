CREATE OR REPLACE PROCEDURE SCOTT.IMPORTE_VENTA (
  V_PRECIO   IN  NUMBER, 
  V_CANTIDAD IN  NUMBER,
  V_IMPORTE  OUT NUMBER,
  V_IMPUESTO OUT NUMBER,
  V_TOTAL    OUT NUMBER
) 
AS
BEGIN
  V_TOTAL := V_PRECIO * V_CANTIDAD;
  V_IMPUESTO := V_TOTAL*0.18;
  V_IMPORTE := V_TOTAL - V_IMPUESTO;
END;

-- CORREGIR
-- ALGO ESTA MAL

DECLARE
	IMPORTE NUMBER;
	IMPUESTO NUMBER;
	TOTAL NUMBER;
BEGIN
	SCOTT.IMPORTE_VENTA(10,20, IMPORTE, IMPUESTO, TOTAL);
	DBMS_OUTPUT.PUT_LINE(IMPORTE);
	DBMS_OUTPUT.PUT_LINE(IMPUESTO);
	DBMS_OUTPUT.PUT_LINE(TOTAL);
END;