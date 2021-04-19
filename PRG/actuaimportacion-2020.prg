SET PATH TO c:\cnwga\prg 
SET EXCLUSIVE OFF
SET DATE ITALIAN
SET DELETED ON
OPEN DATABASE c:\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\prg\actualizarleg
X = CREATEOBJECT("actualizarleg")

clear
SELECT 0
USE importac2020 AGAIN
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
 
      x.CLegajo = importac2020.legajo
      x.Ccuil   = importac2020.cuil
      x.ClcargaEsposa = 1
      x.cnombre = importac2020.nombre
      ?importac2020.legajo
      *importac2020.nombre + "-------------------> " + STR(importac2020.donacio,12,2)
     * x.Actgastosmedicos(tf,importac2020.gastosmed)
      * x.actctamed(tf)
     * x.actualizaresposa(tf) 
      * x.ActualizarHijo(tf)
      *x.ActDonacio(tf)
      *x.ActCreditohipo(tf,importac2020.credith)
         IF importac2020.hijos <>0 
           * concepto 330
            
           xconcepto = 1
           DO actuhijo-2020 WITH importac2020.legajo,importac2020.hijos,Varmes,xconcepto
         ENDIF  
         
         IF importac2020.ctamed <> 0
             * concepto 362     
            xconcepto = 2
            DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.ctamed,Varmes,xconcepto 
         ENDIF
         IF importac2020.credith <> 0
            * concepto 360
            xconcepto = 3
            wimpohipo = 0
            IF importac2020.credith > 20000
               wimpohipo = 20000
            ELSE    
               wimpohipo = importac2020.credith
           ENDIF
            DO actgastosmedicos-2020 WITH importac2020.legajo,wimpohipo,Varmes,xconcepto
         ENDIF 
         IF importac2020.donacio <> 0
            
           * concepto 363         
            xconcepto = 4
            DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.donacio,Varmes,xconcepto
         ENDIF
         IF importac2020.ESPOSA <> 0
            
            xconcepto = 2
            * concepto 320
            DO actuhijo-2020 WITH importac2020.legajo,importac2020.esposa,Varmes,xconcepto
         ENDIF
         IF importac2020.gastosmed <> 0
            xconcepto = 6 
            DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.gastosmed,Varmes,xconcepto
         ENDIF
   
         IF importac2020.segurodevi <> 0
            xconcepto = 10 
            LOCAL SeguroDeVida
            SeguroDeVida = 0
            IF importac2020.segurodevi > 18000
               SeguroDeVida = 18000
            ELSE
               SeguroDeVida = importac2020.segurodevi
            ENDIF
            
            
            DO actgastosmedicos-2020 WITH importac2020.legajo,SeguroDeVida,Varmes,xconcepto
         ENDIF

         IF importac2020.alquileres <> 0
            xconcepto = 7 
            DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.alquileres,Varmes,xconcepto
         ENDIF
 
         IF importac2020.dolares <> 0
             xconcepto = 8
             ?nombre
             DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.dolares,Varmes,xconcepto
         ENDIF|    
         
         IF importac2020.seguroreti <> 0
            xconcepto = 9
            
            DO actgastosmedicos-2020 WITH importac2020.legajo,importac2020.seguroreti,Varmes,xconcepto
         ENDIF    

   SELECT importac2020
   SKIP 
*ENDSCAN
ENDDO
tf.close
CLOSE TABLES all


**********************
FUNCTION ACTHIJO
*****************
*SELECT LEGAJO, HIJOS FROM importac2020;
WHERE HIJOS <> 0; 
 INTO ARRAY  LISTAHI
 
*?ALEN(LISTAHI)
*WAIT " "
*FOR I=1 TO ALEN(LISTAHI)/2

   *? STR(I,2) + STR(LISTAHI(I,1),4)+ " " + STR(LISTAHI(I,2),2)
*   DO act572 WITH listahi(I,1),listahi(I,2) 

*NEXT

