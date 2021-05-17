
SET PATH TO c:\cnwga\prg 
SET EXCLUSIVE OFF
SET DATE ITALIAN
SET DELETED ON
*OPEN DATABASE f:\nwga\datos\GANANCIAS.DBC SHARED
OPEN DATABASE C:\nwga\datos\ganancias
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
X = CREATEOBJECT("actualizarleg")

CLEAR
IF USED("importac")
   SELECT importac
   USE
ENDIF    

SELECT 0
USE importac AGAIN
GO top
*SET FILTER TO importac.fechapresenta >= CTOD('1-11-18')
*BROWSE

CLEAR

fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
*SCAN 
 Varmes = 4
 CLEAR
 DO WHILE .NOT. EOF() 
 
      x.CLegajo = importac.legajo
      x.Ccuil   = importac.cuil
      x.ClcargaEsposa = 1
      x.cnombre = importac.nombre
      ?importac.legajo
      *importac.nombre + "-------------------> " + STR(importac.donacio,12,2)
     * x.Actgastosmedicos(tf,importac.gastosmed)
      * x.actctamed(tf)
     * x.actualizaresposa(tf) 
      * x.ActualizarHijo(tf)
      *x.ActDonacio(tf)
      *x.ActCreditohipo(tf,importac.credith)
         IF importaC.hijos <>0 
           * concepto 330
           
           xconcepto = 1
           DO actuhijo WITH importac.legajo,importac.hijos,Varmes,xconcepto
         ENDIF  
         
         IF importac.ctamed <> 0
             * concepto 362     
            xconcepto = 2
            DO actgastosmedicos WITH importac.legajo,importac.ctamed,Varmes,xconcepto 
         ENDIF
         IF IMPORTAC.credith <> 0
            * concepto 360
            xconcepto = 3
            wimpohipo = 0
            IF importac.credith > 1666.67
               wimpohipo = 1666.67
            ELSE    
               wimpohipo = importac.credith
           ENDIF
            DO actgastosmedicos WITH importac.legajo,wimpohipo,Varmes,xconcepto
         ENDIF 
         IF IMPORTAC.donacio <> 0
            
           * concepto 363         
            xconcepto = 4
            DO actgastosmedicos WITH importac.legajo,importac.donacio,Varmes,xconcepto
         ENDIF
         IF IMPORTAC.ESPOSA <> 0
            
            xconcepto = 2
            * concepto 320
            DO actuhijo WITH importac.legajo,importac.esposa,Varmes,xconcepto
         ENDIF
         IF IMPORTAC.gastosmed <> 0
            xconcepto = 6 
            DO actgastosmedicos WITH importac.legajo,importac.gastosmed,Varmes,xconcepto
         ENDIF
   
         IF IMPORTAC.segurodevi <> 0
            *valor 18.000 para año 2020
            LOCAL FloatSeguro
            FloatSeguro = 0
            IF IMPORTAC.SeguroDeVi > 24000
               FloatSeguro = 24000
            ELSE
               FloatSeguro = IMPORTAC.SeguroDeVi
            ENDIF    
            xconcepto = 8
            DO actgastosmedicos WITH importac.legajo,FloatSeguro,Varmes,xconcepto
         ENDIF
         
          IF IMPORTAC.alquileres <> 0
            xconcepto = 7 
            DO actgastosmedicos WITH importac.legajo,importac.alquileres,Varmes,xconcepto
         ENDIF

         IF IMPORTAC.seguroreti <> 0
             xconcepto = 9   
             DO actgastosmedicos WITH importac.legajo,importac.seguroreti,Varmes,xconcepto
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
*SELECT LEGAJO, HIJOS FROM IMPORTAC;
WHERE HIJOS <> 0; 
 INTO ARRAY  LISTAHI
 
*?ALEN(LISTAHI)
*WAIT " "
*FOR I=1 TO ALEN(LISTAHI)/2

   *? STR(I,2) + STR(LISTAHI(I,1),4)+ " " + STR(LISTAHI(I,2),2)
*   DO act572 WITH listahi(I,1),listahi(I,2) 

*NEXT

