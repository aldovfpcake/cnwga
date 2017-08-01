
PARAMETERS WLEGAJO,tf

 
WIMPORTE  = 48447
WCONCEPTO = 320
WUNIDADES = 1

linea = "actualizando esposa" + STR(wlegajo,4)
tf.WriteLine(linea)
 
UPDATE NLEGAJO SET JULIO     = ((WIMPORTE/12)*7),;
                   AGOSTO    = ((WIMPORTE/12)*8),;
                   SETIEMBRE = ((WIMPORTE/12)*9),;
                   OCTUBRE   = ((WIMPORTE/12)*10),;
                   NOVIEMBRE = ((WIMPORTE/12)*11),;
                   DICIEMBRE =  WIMPORTE*WUNIDADES;
                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
 return                  