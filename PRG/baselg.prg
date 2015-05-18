*422
PARAMETERS legajo
IF legajo = 422
   return 
ENDIF

Varleg   = legajo
Varempre = 1
Varno    = 2014


SELECT n.concepto,s.descripcio,s.clase,n.diciembre from nlegajo as n INNER JOIN nconceptos as s;
ON n.concepto = s.concepto  WHERE n.legajo = Varleg .and. n.empresa =Varempre  .and. n.ano=Varno  .and. n.concepto >= 320 .and. n.concepto <= 363  ORDER BY n.concepto INTO CURSOR base
SCAN
  SELECT CONCEPTO ,DICIEMBRE FROM NLEGAJO WHERE legajo = varleg .and. ano = 2015 .and. empresa = Varempre .and. concepto = base.concepto ;
  INTO CURSOR EXISTE
     
  
  IF EOF() .AND. EXISTE.DICIEMBRE =0
     IF BASE.DICIEMBRE <> 0
        WAIT WINDOW "INSERT.. " + STR(BASE.CONCEPTO,4) + " "+BASE.DESCRIPCIO+ " " + STR(BASE.DICIEMBRE,7,2)
     ENDIF
  
  ELSE
     IF BASE.DICIEMBRE <> 0
        * WAIT WINDOW "UPDATE..." + STR(BASE.CONCEPTO,4)+ "  " +BASE.DESCRIPCIO+ " "+ STR(BASE.DICIEMBRE,7,2)
         UPDATE NLEGAJO SET ENERO = BASE.DICIEMBRE/12,;
                          FEBRERO = BASE.DICIEMBRE/12*2,;
                          MARZO   = BASE.DICIEMBRE/12*3,;
                          ABRIL   = BASE.DICIEMBRE/12*4,;
                          MAYO    = BASE.DICIEMBRE/12*5,;
                          JUNIO   = BASE.DICIEMBRE/12*6,;
                          JULIO   = BASE.DICIEMBRE/12*7,;
                          AGOSTO  = BASE.DICIEMBRE/12*8,;
                       SETIEMBRE  = BASE.DICIEMBRE/12*9,;
                         OCTUBRE  = BASE.DICIEMBRE/12*10,;
                       NOVIEMBRE  = BASE.DICIEMBRE/12*11,;
                       DICIEMBRE  = BASE.DICIEMBRE ;        
                       WHERE  legajo = Varleg .and. empresa =Varempre  .and. ano= 2015 .and. concepto = base.concepto 
         
     ENDIF
     SELECT BASE
  ENDIF   
ENDSCAN
RETURN