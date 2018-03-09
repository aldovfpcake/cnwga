
PARAMETERS WLEGAJO,WIMPORTE,WMES,WCPTO

DO CASE
   CASE WCPTO  = 1
        WCONCEPTO = 330
        WIMPORTE = 
        * hijos  
   CASE WCPTO  = 2
        WCONCEPTO = 362
        * ctamedico
   CASE WCPTO  = 3
        WCONCEPTO = 360
        * Credito Hipotecario

   CASE WCPTO  = 4
        WCONCEPTO = 363
        * donaciones

    CASE WCPTO  = 5
        WCONCEPTO = 320
        * donaciones

     CASE WCPTO  = 6
        WCONCEPTO = 365
        * donaciones
     
ENDCASE        



IF WMES = 1
   UPDATE NLEGAJO SET ENERO   = WIMPORTE,;
                                   FEBRERO    = WIMPORTE,;
                                   MARZO      = WIMPORTE,;
                                   ABRIL      = WIMPORTE,;
                                   MAYO       = WIMPORTE,;
                                   JUNIO      = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF

IF WMES = 2
   UPDATE NLEGAJO SET  FEBRERO    = WIMPORTE,;
                                   MARZO      = WIMPORTE,;
                                   ABRIL      = WIMPORTE,;
                                   MAYO       = WIMPORTE,;
                                   JUNIO      = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF

IF WMES = 3
   UPDATE NLEGAJO SET   MARZO = WIMPORTE,;
                                   ABRIL      = WIMPORTE,;
                                   MAYO       = WIMPORTE,;
                                   JUNIO      = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF

IF WMES = 4
   UPDATE NLEGAJO SET    ABRIL  = WIMPORTE,;
                                   MAYO       = WIMPORTE,;
                                   JUNIO      = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF



IF WMES = 5
   UPDATE NLEGAJO SET   MAYO  = WIMPORTE,;
                                   JUNIO      = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF

IF WMES = 6
   UPDATE NLEGAJO SET   JUNIO  = WIMPORTE,;
                                   JULIO      = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF


IF WMES = 7
   UPDATE NLEGAJO SET   JULIO  = WIMPORTE,;
                                   AGOSTO     = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF


IF WMES = 8
   UPDATE NLEGAJO  SET  AGOSTO  = WIMPORTE,;
                                   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF


IF WMES = 9
   UPDATE NLEGAJO SET   SETIEMBRE  = WIMPORTE,;
                                   OCTUBRE    = WIMPORTE,;
                                   NOVIEMBRE  = WIMPORTE,;
                                   DICIEMBRE  = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF





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
 

IF WMES = 12 
   UPDATE NLEGAJO SET  DICIEMBRE = WIMPORTE;
                                   WHERE LEGAJO = WLEGAJO AND EMPRESA = 1 AND ANO = 2017 AND CONCEPTO = WCONCEPTO
ENDIF 




 return                  