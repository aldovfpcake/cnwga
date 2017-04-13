SET DELETED ON
SET PATH TO F:\SUELDOS\EMPRE1

SELECT legajo,concepto,enero,febrero,marzo FROM nlegajo WHERE ano= 2017 INTO CURSOR listado1

SELECT legajo,concepto,enero,febrero,marzo FROM listado1 WHERE concepto=600 .or. concepto=605 ORDER BY legajo;
into CURSOR listado2

SELECT P.LEGAJO,P.NOMBRE,L.concepto,l.enero,l.febrero,l.marzo,(l.enero+l.febrero+l.marzo)as total FROM listado2 l INNER JOIN personal p ON p.legajo= l.legajo  ORDER BY p.legajo,l.concepto;
into CURSOR listado3
browse
