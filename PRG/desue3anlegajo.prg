SELECT chapa,nombre,snacion FROM c:\suerut\empre1\sue3  WHERE snacion <> 0INTO CURSOR ganancias
CLEAR
SET TEXTMERGE ON
STORE FCREATE('G:\myNamesFile.txt') TO _TEXT

SCAN
        SELECT LEGAJO,ABRIL FROM NLEGAJO  WHERE EMPRESA = 1 .AND. CONCEPTO = 600 .AND. ANO = 2012 .AND. LEGAJO = ganancias.chapa;
        INTO CURSOR EXISTE
        
        IF (EXISTE.ABRIL - GANANCIAS.SNACION) > 1
           WAIT WINDOW "NO COINCIDE " + STR(GANANCIAS.CHAPA,4) + " "+ GANANCIAS.NOMBRE
           TEXT 
           <<EXISTE.LEGAJO>> <<EXISTE.ABRIL>> ---<<GANANCIAS.CHAPA>> ---<<GANANCIAS.SNACION>>
           ENDTEXT
      
        ENDIF    
        
        
        
        
               
       *TRY 
       *   UPDATE NLEGAJO SET MARZO = GANANCIAS.SNACION;
          WHERE EMPRESA = 1 .AND. CONCEPTO = 600 .AND. ANO = 2012 .AND. LEGAJO = ganancias.chapa
       *   ?"ACTUALIZANDO " + STR(CHAPA,4)
       *CATCH TO e
       *    MESSAGEBOX( "Error en Actzualización "+ STR(chapa,4),2,"Atención")  
       *    EXIT       
       *ENDTRY

       SELECT ganancias
         

ENDSCAN

RETURN