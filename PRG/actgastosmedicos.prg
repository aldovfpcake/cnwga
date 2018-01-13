
PARAMETERS WLEGAJO,WIMPORTE,WMES



WCONCEPTO = 365 

IF WMES = 10
   UPDATE NLEGAJO SET OCTUBRE   = WIMPORTE,;
                                   NOVIEMBRE = WIMPORTE,;
                                   DICIEMBRE = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF

IF WMES = 11 
   UPDATE NLEGAJO SET  NOVIEMBRE = WIMPORTE,;
                                   DICIEMBRE = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF 
 return                  