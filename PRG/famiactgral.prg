CLEAR
SET PATH TO C:\SUERUT\EMPRE1;F:\SUELDOS\NWGA
SET PROCEDURE TO C:\cnwga\prg\clasfg
SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO;
INTO CURSOR XLEG
SET DEVICE TO FILE C:\PRESENTAFIP\familia.txt
CREATE CURSOR INFOFA (legajo n(4),detalle c(45))
SELECT XLEG
SCAN
	INSERT INTO INFOFA(legajo,detalle) VALUES (xleg.legajo,xleg.nombre)
	?STR(LEGAJO,4) + "-" + NOMBRE
	AGREGA(LEGAJO)
	?"----------"
    
    SELECT XLEG
    
ENDSCAN
SET DEVICE TO SCREEN
SELECT INFOFA
BROWSE
RETURN


FUNCTION AGREGA
PARAMETERS XLEG

x = CREATEOBJECT("ofamilia")
x.oempresa = 1
x.olegajo = xleg
x.busco
?" "
? "Esposa : " + STR(x.oesposa,2) + "    " + "Hijos :" + STR(x.ocanthijos,2)
?" "
INSERT INTO INFOFA(legajo,detalle) VALUES (xleg,"Esposa : " + STR(x.oesposa,2) + "    " + "Hijos :" + STR(x.ocanthijos,2))

RELEASE X


RETURN .T.