SET PATH TO f:\sueldos\empre1

wmes = 'N.febrero'
SELECT N.legajo,P.NOMBRE, N.concepto,&wmes;
 FROM  nlegajo AS N ;
    INNER JOIN ganancias!nconceptos ;
    ON  N.concepto = Nconceptos.concepto;
    WHERE N.ano = 2012 .and. Nconceptos.concepto = 600 .and. &wmes <> 0 ORDER BY N.legajo INTO CURSOR lista
 LIST to c:\suerut\listados\ganancias1.txt
 MODIFY FILE  c:\suerut\listados\ganancias1.txt