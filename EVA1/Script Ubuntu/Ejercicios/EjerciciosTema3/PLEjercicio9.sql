-- Se crea la función y esta devuelve el salario + la comisión
--multiplicado por 14 (12 meses + 2 de pagas extras)
CREATE OR REPLACE FUNCTION QUECHAVAL
(V_EMP EMP.EMPNO%TYPE)
RETURN NUMBER
AS
	V_SAL EMP.SAL%TYPE;
	V_COMM EMP.COMM%TYPE;
	
BEGIN

	SELECT SAL,NVL(COMM,0) INTO V_SAL,V_COMM FROM EMP
	WHERE EMPNO=V_EMP; 
	
	RETURN (V_SAL+V_COMM)*14;

END QUECHAVAL;
/
--Se obtiene el resultado y se muestra en pantalla
--Se hace una excepción para empleados inexistentes
DECLARE

	V_VAR NUMBER;
	V_EMP NUMBER:=&EMPLEADO;
	
BEGIN

	V_VAR:=QUECHAVAL(V_EMP);
	DBMS_OUTPUT.PUT_LINE('El salario anual es el siguiente: '||V_VAR);
	
EXCEPTION WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('NO EXISTE EL EMPLEADO');
END;
/

