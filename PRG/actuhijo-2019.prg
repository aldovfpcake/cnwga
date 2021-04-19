
PARAMETERS WLEGAJO,WUNIDADES,Varmes,WCOD

DO CASE
   CASE WCOD = 1
           WIMPORTE  = 58232.65
           WCONCEPTO = 330
           *
           *HIJOS
           *
   CASE WCOD = 2	
           WIMPORTE  = 115471.38
           WCONCEPTO = 320
           *
           * CONYUGE
           * 

   CASE WCOD = 3
           WUNIDADES = 1
           WIMPORTE  = 18000
           WCONCEPTO = 361    
           *
           * SEGURO DE VIDA
           *


ENDCASE   


IF WCOD = 7

UPDATE NLEGAJO SET    ENERO      = ((66917.91/12)*1),; 
                      FEBRERO    = ((66917.91/12)*2),;  
                      MARZO      = ((66917.91/12)*3) ,;
   					          ABRIL      = ((66917.91/12)*4) ,; 
                      MAYO       = ((66917.91/12)*5) ,;  
                      JUNIO      = ((66917.91/12)*6) ,;
                      JULIO      = ((66917.91/12)*7) ,;
                      AGOSTO     = ((66917.91/12)*8) ,; 
                      SETIEMBRE  = ((66917.91/12)*9) ,; 
                      OCTUBRE    = ((66917.91/12)*10),;
                      NOVIEMBRE  = ((66917.91/12)*11),;
                      DICIEMBRE  =  66917.91;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = 310


UPDATE NLEGAJO SET    ENERO      = ((321205.97/12)*1),; 
                      FEBRERO    = ((321205.97/12)*2),;  
                      MARZO      = ((321205.97/12)*3) ,;
   					  ABRIL      = ((321205.97/12)*4) ,; 
                      MAYO       = ((321205.97/12)*5) ,;  
                      JUNIO      = ((321205.97/12)*6) ,;
                      JULIO      = ((321205.97/12)*7) ,;
                      AGOSTO     = ((321205.97/12)*8) ,; 
                      SETIEMBRE  = ((321205.97/12)*9) ,; 
                      OCTUBRE    = ((321205.97/12)*10),;
                      NOVIEMBRE  = ((321205.97/12)*11),;
                      DICIEMBRE  =  321205.97;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = 300




IF Varmes = 1
   UPDATE NLEGAJO SET ENERO      = ((WIMPORTE/12)*1) *WUNIDADES,; 
                      FEBRERO    = ((WIMPORTE/12)*2) *WUNIDADES,;  
                      MARZO      = ((WIMPORTE/12)*3) *WUNIDADES,;
   					  ABRIL      = ((WIMPORTE/12)*4) *WUNIDADES,; 
                      MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF

ENDIF


IF Varmes = 2
   UPDATE NLEGAJO SET FEBRERO    = ((WIMPORTE/12)*2) *WUNIDADES,;  
                      MARZO      = ((WIMPORTE/12)*3) *WUNIDADES,;
   					  ABRIL      = ((WIMPORTE/12)*4) *WUNIDADES,; 
                      MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 3
   UPDATE NLEGAJO SET MARZO      = ((WIMPORTE/12)*3) *WUNIDADES,;
   					  ABRIL      = ((WIMPORTE/12)*4) *WUNIDADES,; 
                      MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF

IF Varmes = 4
   UPDATE NLEGAJO SET ABRIL      = ((WIMPORTE/12)*4) *WUNIDADES,; 
                      MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 5
   UPDATE NLEGAJO SET MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 5
   UPDATE NLEGAJO SET MAYO       = ((WIMPORTE/12)*5) *WUNIDADES,;  
                      JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 6
   UPDATE NLEGAJO SET JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 7
   UPDATE NLEGAJO SET JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 8
   UPDATE NLEGAJO SET  AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 9
   UPDATE NLEGAJO SET  SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE   = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 10
   UPDATE NLEGAJO SET  OCTUBRE   = ((WIMPORTE/12)*10) *WUNIDADES,;
                   NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                   DICIEMBRE =  WIMPORTE*WUNIDADES;
                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO
 
ENDIF

IF Varmes = 11 
   UPDATE NLEGAJO SET NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE =  WIMPORTE*WUNIDADES;
                    WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO 
 

ENDIF 
 
IF Varmes = 12 
   UPDATE NLEGAJO SET  DICIEMBRE =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2020 AND CONCEPTO = WCONCEPTO 
 

ENDIF 












 return                  