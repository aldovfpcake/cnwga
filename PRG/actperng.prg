SET EXCLUSIVE OFF
SET DATE ITALIAN
SET DELETED ON
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
SET PATH TO F:\SUELDOS\EMPRE1;c:\cnwga\prg
SELECT LEGAJO, NOMBRE FROM PERSONAL WHERE ACTIVO = "A" INTO CURSOR LISTA
SCAN
   ? LISTA.LEGAJO
   DO actuhijo-2018 WITH lista.legajo,0,0,7   
ENDSCAN