SELECT legajo,diciembre FROM nlegajo WHERE concepto = 361 .and. ano = 2013 ORDER BY legajo;
into CURSOR lista
vvseguro = 996.12
SCAN
   IF LISTA.DICIEMBRE <> 0
   		UPDATE NLEGAJO SET ENERO   =   (vvseguro/12)*1,;
                       FEBRERO     =   (vvseguro/12)*2,;
                       MARZO       =   (vvseguro/12)*3,;
                       ABRIL       =   (vvseguro/12)*4,;
					   MAYO   	   =   (vvseguro/12)*5,;
 					   JUNIO       =   (vvseguro/12)*6,;
                       JULIO       =   (vvseguro/12)*7,;
                       AGOSTO      =   (vvseguro/12)*8,;
                       SETIEMBRE   =   (vvseguro/12)*9,;
                       OCTUBRE     =   (vvseguro/12)*10,;
                       NOVIEMBRE   =   (vvseguro/12)*11,;
                       DICIEMBRE   =   (vvseguro/12)*12; 
                       WHERE LEGAJO = LISTA.LEGAJO .AND. ANO = 2014 .AND. CONCEPTO = 361
                       ? "Legajo  : " + str(lista.legajo,4)
   ENDIF              

ENDSCAN
