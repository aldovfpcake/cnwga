SET EXCLUSIVE OFF
SET PATH TO F:\SUELDOS\EMPRE1

SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO INTO CURSOR LISTA 

SCAN

 VarLegajo = lista.legajo
 VarDif = 0 
 sumar()
 VarDif = INFTOT.Totreten 
 ?STR(lista.legajo,4) + " "+ lista.nombre + " " + STR(VarDif,10,2)
 
 remple(Vardif)
 SELECT personaL

ENDSCAN





***********************
FUNCTION SUMAR
**********************
 SELECT MAYO AS Totreten;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 600;
 INTO CURSOR INFTOT
 
* SELECT ABRIL AS Ttaren;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 602;
 INTO CURSOR ARET
 
 
 
 RETURN .T.



************************
FUNCTION REMPLE
******************
PARAMETERS VarDif

UPDATE NLEGAJO SET MAYO = VarDif;
WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 605
RETURN .T.    
     