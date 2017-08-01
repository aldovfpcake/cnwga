
PARAMETERS WLEGAJO,WIMPORTE



WCONCEPTO = 363


UPDATE NLEGAJO SET JULIO     = WIMPORTE,;
                   AGOSTO    = WIMPORTE,;
                   SETIEMBRE = WIMPORTE,;
                   OCTUBRE   = WIMPORTE,;
                   NOVIEMBRE = WIMPORTE,;
                   DICIEMBRE = WIMPORTE;
                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
 return                  