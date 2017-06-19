SET EXCLUSIVE OFF
SET PATH TO F:\SUELDOS\EMPRE1

SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO INTO CURSOR LISTA 

SCAN

 VarLegajo = lista.legajo
 ?STR(lista.legajo,4) + " "+ lista.nombre 
 sumar()
 remple()
 SELECT personaL

ENDSCAN





***********************
FUNCTION SUMAR
**********************
 SELECT (ENERO + FEBRERO + MARZO) AS Totreten;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 605;
 INTO CURSOR INFTOT
 
 SELECT (ENERO + FEBRERO + MARZO) AS Ttaren;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 600;
 INTO CURSOR ARET
 
 
 
 RETURN .T.



************************
FUNCTION REMPLE
******************
Vsaldo =0
Vsaldo = ARET.ttaren - INFTOT.Totreten 

UPDATE NLEGAJO SET ABRIL = Vsaldo;
WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 602
RETURN .T.    
     