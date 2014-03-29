*SET DEVICE TO PRINT
*SET PRINTER ON
?" Actualización de Donaciones"
SELECT legajo,diciembre FROM nlegajo WHERE concepto = 363 .and. ano = 2013 ORDER BY legajo;
into CURSOR lista
SCAN
   IF LISTA.DICIEMBRE <> 0
   		UPDATE NLEGAJO SET ENERO   = (LISTA.DICIEMBRE/12)*1,;
                       FEBRERO     =  (LISTA.DICIEMBRE/12)*2,;
                       MARZO       =  (LISTA.DICIEMBRE/12)*3,;
                       ABRIL       =  (LISTA.DICIEMBRE/12)*4,;
					   MAYO   	   =  (LISTA.DICIEMBRE/12)*5,;
 					   JUNIO       =  (LISTA.DICIEMBRE/12)*6,;
                       JULIO       =  (LISTA.DICIEMBRE/12)*7,;
                       AGOSTO      =  (LISTA.DICIEMBRE/12)*8,;
                       SETIEMBRE   =  (LISTA.DICIEMBRE/12)*9,;
                       OCTUBRE     =  (LISTA.DICIEMBRE/12)*10,;
                       NOVIEMBRE   =  (LISTA.DICIEMBRE/12)*11,;
                       DICIEMBRE   =  (LISTA.DICIEMBRE/12)*12; 
                       WHERE LEGAJO = LISTA.LEGAJO .AND. ANO = 2014 .AND. CONCEPTO = 363
                       ? "legajo " + STR(lista.legajo,4)
       
       
   ENDIF              

ENDSCAN
*SET DEVICE TO SCREEN 
*SET PRINTER OFF