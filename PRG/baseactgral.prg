CLEAR
SET PATH TO C:\SUERUT\EMPRE1;F:\SUELDOS\NWGA
SET PROCEDURE TO C:\cnwga\prg\clasfg
SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO;
INTO CURSOR XLEG
SCAN
	?STR(LEGAJO,4) + "-" + NOMBRE
	AGREGA(LEGAJO)
	?"----------"
ENDSCAN
CLOSE TABLES ALL

FUNCTION AGREGA
PARAMETERS XLEG

x = CREATEOBJECT("conceptos")
x.ano     = 2014
x.legajo  = XLEG
x.empresa = 1
SELECT * from nconceptos;
into CURSOR curcon
scan
  x.codigo = curcon.concepto
  x.agregar
endscan



RELEASE X








RETURN .T.