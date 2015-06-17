SELECT  legajo,enero,febrero,marzo,abril;
FROM NLEGAJO WHERE CONCEPTO = 600 .AND. ANO =2015;
INTO CURSOR LISTA
SCAN

     UPDATE NLEGAJO SET ENERO   = LISTA.ENERO,;
                        FEBRERO = LISTA.FEBRERO,;
                        MARZO   = LISTA.MARZO,;
                        ABRIL   = LISTA.ABRIL;
                        WHERE CONCEPTO = 605 .AND. LEGAJO = LISTA.LEGAJO .AND. ANO = 2015
     SELECT LISTA   
    
ENDSCAN 