CLEAR
SET EXCLUSIVE OFF
SET PATH TO C:\SUERUT\EMPRE1;F:\SUELDOS\NWGA;C:\CNWGA\PRG;F:\SUELDOS\NWGA\DATOS
SET PROCEDURE TO C:\cnwga\prg\clasfg
SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO;
INTO CURSOR XLEG
SCAN
*	?STR(LEGAJO,4) + "-" + NOMBRE
	
	*DO BASELG WITH LEGAJO
	
	AGREGA(LEGAJO)
	?"----------" + STR(xleg.legajo,4) + " "+ xleg.nombre
	SELECT xleg
	
ENDSCAN
CLOSE TABLES ALL

FUNCTION AGREGA
PARAMETERS XLEG

x = CREATEOBJECT("conceptos")
x.ano     = 2018
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

FUNCTION AGREGA2
PARAMETERS XLEG
x = CREATEOBJECT("conceptos")
x.ano = 2015
x.legajo = 598
x.codigo = 605
x.empresa = 1
x.agregar
RELEASE X
RETURN .T.
