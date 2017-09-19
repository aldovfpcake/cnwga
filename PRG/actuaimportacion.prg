
SET PATH TO c:\cnwga\prg 
SET EXCLUSIVE OFF
SET DELETED ON
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
X = CREATEOBJECT("actualizarleg")

clear
SELECT 0
USE importac AGAIN
SET FILTER TO importac.fechapresenta > CTOD('15-08-17')

CLEAR

fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
*SCAN 
 DO WHILE .NOT. EOF() 
  IF  importac.gastosmed <> 0
      x.CLegajo = importac.legajo
      x.Ccuil   = importac.cuil
      x.ClcargaEsposa = 1
      x.cnombre = importac.nombre
      *importac.nombre + "-------------------> " + STR(importac.donacio,12,2)
     * x.Actgastosmedicos(tf,importac.gastosmed)
      * x.actctamed(tf)
     * x.actualizaresposa(tf) 
      * x.ActualizarHijo(tf)
      *x.ActDonacio(tf)
      *x.ActCreditohipo(tf,importac.credith)
     
      *  DO actuhijo WITH importac.legajo,importac.hijos
      *  DO actamedico with importac.legajo,importac.ctamed 
      *  DO actacredito with importac.legajo,importac.credith
     *   DO actdonacio with importac.legajo,importac.donacio
       * DO ACTUESPOSA WITH IMPORTAC.LEGAJO,tf 
         DO actgastosmedicos WITH importac.legajo,importac.gastosmed
  ENDIF
   SELECT IMPORTAC
   SKIP 
*ENDSCAN
ENDDO
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

