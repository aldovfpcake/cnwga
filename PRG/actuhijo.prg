
PARAMETERS WLEGAJO,WUNIDADES,Varmes,WCOD

DO CASE
   CASE WCOD = 1
           WIMPORTE  = 31461.09
           WCONCEPTO = 330
   CASE WCOD = 2	
           WIMPORTE  = 62385.20
           WCONCEPTO = 320
ENDCASE   



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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 2
   UPDATE NLEGAJO SET
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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
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
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 6
   UPDATE NLEGAJO SET JUNIO      = ((WIMPORTE/12)*6) *WUNIDADES,;
                      JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 7
   UPDATE NLEGAJO SET JULIO      = ((WIMPORTE/12)*7) *WUNIDADES,;
                      AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 8
   UPDATE NLEGAJO SET  AGOSTO     = ((WIMPORTE/12)*8) *WUNIDADES,; 
                      SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE    = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE  = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE  =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF



IF Varmes = 9
   UPDATE NLEGAJO SET  SETIEMBRE  = ((WIMPORTE/12)*9) *WUNIDADES,; 
                      OCTUBRE   = ((WIMPORTE/12)*10) *WUNIDADES,;
                      NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF


IF Varmes = 10
   UPDATE NLEGAJO SET  OCTUBRE   = ((WIMPORTE/12)*10) *WUNIDADES,;
                   NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                   DICIEMBRE =  WIMPORTE*WUNIDADES;
                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO
 
ENDIF

IF Varmes = 11 
   UPDATE NLEGAJO SET NOVIEMBRE = ((WIMPORTE/12)*11) *WUNIDADES,;
                      DICIEMBRE =  WIMPORTE*WUNIDADES;
                    WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO 
 

ENDIF 
 
IF Varmes = 12 
   UPDATE NLEGAJO SET  DICIEMBRE =  WIMPORTE*WUNIDADES;
                      WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2018 AND CONCEPTO = WCONCEPTO 
 

ENDIF 












 return                  