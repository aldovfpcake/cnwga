SET EXCLUSIVE OFF
SET PATH TO F:\SUELDOS\EMPRE1

SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO INTO CURSOR LISTA 
tot = 0
fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
SCAN

 VarLegajo = lista.legajo
 ?STR(lista.legajo,4) + " "+ lista.nombre 
 sumar()
 remple()
 SELECT lista

ENDSCAN
linea = "Total............:" + STR(tot,12,2)

tf.WriteLine(linea)
tf.Close


***********************
FUNCTION SUMAR
**********************
 SELECT MARZO AS Totreten;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2018 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 600;
 INTO CURSOR INFTOT
 
 *SELECT JULIO AS Ttaren;
 *FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 602;
 *INTO CURSOR ARET
 
 
 
 RETURN .T.



************************
FUNCTION REMPLE
******************
Vsaldo =0
*IF aret.Ttaren < 0 
*   Vsaldo = aret.Ttaren + inftot.Totreten 
*ELSE
*   Vsaldo = inftot.Totreten - aret.Ttaren
*ENDIF
*tot = tot + Vsaldo
*linea = STR(lista.legajo,4) +" "+ lista.nombre + "  " + STR(Vsaldo,10,2)
*tf.WriteLine(linea)
SELECT MARZO FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2018 .AND. CONCEPTO = 605;
INTO CURSOR EXISTE

IF EXISTE.MARZO <> 0
   RETURN .T.
ENDIF

Vsaldo =inftot.Totreten
tot = tot + inftot.Totreten
UPDATE NLEGAJO SET MARZO = Vsaldo;
WHERE EMPRESA = 1 .AND. ANO = 2018 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 605
RETURN .T.    
     