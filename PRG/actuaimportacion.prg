
SET PATH TO c:\cnwga\prg 
SET EXCLUSIVE OFF
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
X = CREATEOBJECT("actualizarleg")

clear
SELECT 0
USE importac AGAIN

CLEAR

fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
SCAN
  IF  importac.credith <> 0
     ?STR(legajo,4) + " -hijos = "+ STR(hijos,1)
      x.CLegajo = importac.legajo
     *x.ClcargaEsposa = 1
     *x.ActualizarHijo(tf)
     * x.ActDonacio(tf)
      x.ActCreditohipo(tf,importac.credith)
     *DO actuhijo WITH importac.legajo,importac.hijos
     * DO actamedico with importac.legajo,importac.ctamed 
      *DO actacredito with importac.legajo,importac.credith
      *DO actdonacio with importac.legajo,importac.donacio

  ENDIF
   SELECT IMPORTAC
ENDSCAN
tf.close
CLOSE TABLES all


**********************
FUNCTION ACTHIJO
*****************
SELECT LEGAJO, HIJOS FROM IMPORTAC;
WHERE HIJOS <> 0; 
 INTO ARRAY  LISTAHI
 
?ALEN(LISTAHI)
WAIT " "
FOR I=1 TO ALEN(LISTAHI)/2

   *? STR(I,2) + STR(LISTAHI(I,1),4)+ " " + STR(LISTAHI(I,2),2)
   DO act572 WITH listahi(I,1),listahi(I,2) 

NEXT

