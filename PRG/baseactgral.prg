CLEAR
SET EXCLUSIVE OFF
*SET PATH TO F:\SUELDOS\NWGA;C:\CNWGA\PRG;F:\SUELDOS\NWGA\DATOS;F:\SUELDOS\EMPRE1

SET PATH TO C:\SUERUT\EMPRE1;C:\nwga\datos
SET PROCEDURE TO C:\cnwga\prg\clasfg
OPEN DATABASE GANANCIAS
SELECT LEGAJO,NOMBRE,FECHAING FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO;
INTO CURSOR XLEG
CLEAR
SCAN
*	?STR(LEGAJO,4) + "-" + NOMBRE
	
	*DO BASELG WITH LEGAJO
	IF YEAR(xleg.fechaing) < 2021
		AGREGA3(xleg.LEGAJO)
	   *?"----------" + STR(xleg.legajo,4) + " "+ xleg.nombre
	   SELECT xleg
	ENDIF
	SELECT XLEG
ENDSCAN
SELECT nlegajo
BROWSE FOR concepto = 368
CLOSE TABLES ALL

FUNCTION AGREGA
PARAMETERS XLEG

x = CREATEOBJECT("conceptos")
x.ano     = 2021
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
PARAMETERS VarLegajo
x = CREATEOBJECT("conceptos")
x.ano = 2015
x.legajo = 598
x.codigo = 605
x.empresa = 1
x.agregar
RELEASE X
RETURN .T.

FUNCTION AGREGA3
PARAMETERS Varlegajo
x = CREATEOBJECT("conceptos")
?Varlegajo
LOCAL wleg as Number
wleg = Varlegajo
x.ano      = 2020
x.legajo    = wleg
x.empresa  = 1
x.codigo   = 367
x.agregar
?x.aid
?x.legajo
RELEASE X
RETURN .T.