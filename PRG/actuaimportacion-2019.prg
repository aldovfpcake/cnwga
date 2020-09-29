SET PATH TO c:\cnwga\prg 
SET EXCLUSIVE OFF
SET DATE ITALIAN
SET DELETED ON
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
X = CREATEOBJECT("actualizarleg")

clear
SELECT 0
USE importac2019 AGAIN
GO top
*SET FILTER TO importac.fechapresenta >= CTOD('1-11-18')
*BROWSE

CLEAR

fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
*SCAN 
 Varmes = 12
 CLEAR
 DO WHILE .NOT. EOF() 
 
      x.CLegajo = importac2019.legajo
      x.Ccuil   = importac2019.cuil
      x.ClcargaEsposa = 1
      x.cnombre = importac2019.nombre
      ?importac2019.legajo
      *importac2019.nombre + "-------------------> " + STR(importac2019.donacio,12,2)
     * x.Actgastosmedicos(tf,importac2019.gastosmed)
      * x.actctamed(tf)
     * x.actualizaresposa(tf) 
      * x.ActualizarHijo(tf)
      *x.ActDonacio(tf)
      *x.ActCreditohipo(tf,importac2019.credith)
         IF importac2019.hijos <>0 
           * concepto 330
            
           xconcepto = 1
           DO actuhijo-2019 WITH importac2019.legajo,importac2019.hijos,Varmes,xconcepto
         ENDIF  
         
         IF importac2019.ctamed <> 0
             * concepto 362     
            xconcepto = 2
            DO actgastosmedicos-2019 WITH importac2019.legajo,importac2019.ctamed,Varmes,xconcepto 
         ENDIF
         IF importac2019.credith <> 0
            * concepto 360
            xconcepto = 3
            wimpohipo = 0
            IF importac2019.credith > 20000
               wimpohipo = 20000
            ELSE    
               wimpohipo = importac2019.credith
           ENDIF
            DO actgastosmedicos-2019 WITH importac2019.legajo,wimpohipo,Varmes,xconcepto
         ENDIF 
         IF importac2019.donacio <> 0
            
           * concepto 363         
            xconcepto = 4
            DO actgastosmedicos-2019 WITH importac2019.legajo,importac2019.donacio,Varmes,xconcepto
         ENDIF
         IF importac2019.ESPOSA <> 0
            
            xconcepto = 2
            * concepto 320
            DO actuhijo-2019 WITH importac2019.legajo,importac2019.esposa,Varmes,xconcepto
         ENDIF
         IF importac2019.gastosmed <> 0
            xconcepto = 6 
            DO actgastosmedicos-2019 WITH importac2019.legajo,importac2019.gastosmed,Varmes,xconcepto
         ENDIF
   
         IF importac2019.segurodevida <> 0
            xconcepto = 3 
            DO actuhijo-2019 WITH importac2019.legajo,importac2019.hijos,Varmes,xconcepto
         ENDIF

         IF importac2019.alquileres <> 0
            xconcepto = 7 
            DO actgastosmedicos-2019 WITH importac2019.legajo,importac2019.alquileres,Varmes,xconcepto
         ENDIF


   SELECT importac2019
   SKIP 
*ENDSCAN
ENDDO
tf.close
CLOSE TABLES all


**********************
FUNCTION ACTHIJO
*****************
*SELECT LEGAJO, HIJOS FROM importac2019;
WHERE HIJOS <> 0; 
 INTO ARRAY  LISTAHI
 
*?ALEN(LISTAHI)
*WAIT " "
*FOR I=1 TO ALEN(LISTAHI)/2

   *? STR(I,2) + STR(LISTAHI(I,1),4)+ " " + STR(LISTAHI(I,2),2)
*   DO act572 WITH listahi(I,1),listahi(I,2) 

*NEXT

