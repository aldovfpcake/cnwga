SELECT legajo,julio FROM nlegajo WHERE ano = 2015 .and. concepto = 4 INTO CURSOR LISTA

SCAN
    
    UPDATE NLEGAJO  SET  AGOSTO = LISTA.JULIO WHERE LEGAJO = LISTA.LEGAJO .AND. NLEGAJO.CONCEPTO = 4 .AND. ANO = 2018
    ?lista.legajo
    SELECT LISTA
ENDSCAN
