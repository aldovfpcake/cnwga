SET PATH TO F:\SUELDOS\EMPRE1;C:\CNWGA\PRG

SET DEVICE TO PRINT
SET PRINTER ON

SELECT LEGAJO,NOMBRE,DEPART FROM PERSONAL WHERE DEPART ="SAN MART" .AND. ACTIVO = "A" INTO CURSOR LISTADO
clear
SCAN
      ?LISTADO.LEGAJO
      DO prueboject WITH LISTADO.LEGAJO
   
ENDSCAN    
CLOSE TABLES
RETURN

SET DEVICE TO SCREEN
SET PRINTER OFF