
CREATE OR REPLACE FUNCTION SCOTT.FN_USER
RETURN VARCHAR AS
	V_USER VARCHAR(50);
BEGIN
	select USER INTO V_USER from DUAL;
	RETURN V_USER;
END;
/


select SCOTT.FN_USER() 
from dual 