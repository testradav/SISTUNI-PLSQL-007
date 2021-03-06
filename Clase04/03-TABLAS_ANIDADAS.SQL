/*
TABLA ANIDADA

TYPE type_name IS TABLE OF
 { column_type 
   | variable%TYPE
   | table.column%TYPE} [NOT NULL]
   | table%ROWTYPE
 }

*/


-- EJEMPLO 1

DECLARE
	TYPE tabla_varchar2 IS TABLE OF VARCHAR2 (100);
	empleados   tabla_varchar2 := tabla_varchar2 ();
BEGIN
	-- Tama�o Inicial
	DBMS_OUTPUT.PUT_LINE('Tama�o Inicial: ' || empleados.COUNT);
	-- Se a�aden 4 elementos
	empleados.EXTEND (4);
	empleados (1) := 'Pepe';
	empleados (2) := 'Elena';
	empleados (3) := 'Carmen';
	empleados (4) := 'Juan';
	-- Se a�ade un elemento mas
	empleados.EXTEND;
	empleados (empleados.LAST) := 'Gustavo';
	-- Tama�o Final
	DBMS_OUTPUT.PUT_LINE('Tama�o Final: ' || empleados.COUNT);
	-- Mostrar lista
	FOR I IN 1 .. empleados.COUNT
	LOOP
		DBMS_OUTPUT.put_line ( empleados(I) );
	END LOOP;
END;
/



-- Ejemplo 2

DECLARE
	-- Definimos los tipo de datos
	TYPE TABLA_EMPLEADOS IS TABLE OF RECURSOS.EMPLEADO%ROWTYPE;
	-- Definiendo las variables
	V_EMPLEADOS TABLA_EMPLEADOS;
BEGIN
	V_EMPLEADOS := TABLA_EMPLEADOS();
	DBMS_OUTPUT.PUT_LINE('TAMA�O INICIAL: ' || V_EMPLEADOS.COUNT);
	FOR REC IN (SELECT * FROM RECURSOS.EMPLEADO) LOOP
		V_EMPLEADOS.EXTEND;
		V_EMPLEADOS(V_EMPLEADOS.LAST) := REC;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('TAMA�O FINAL: ' || V_EMPLEADOS.COUNT);
	FOR I IN V_EMPLEADOS.FIRST..V_EMPLEADOS.LAST LOOP
		DBMS_OUTPUT.PUT_LINE( I || '.- ' || V_EMPLEADOS(I).NOMBRE);
	END LOOP;
END;
/






