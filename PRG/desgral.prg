
VMES = "ABRIL"


SELECT LEGAJO,SUM (IIF(CONCEPTO = 500,&VMES,0)) AS IMPUESTO,SUM (IIF(CONCEPTO = 510,&VMES,0))AS DESCTADO;
 FROM NLEGAJO GROUP BY LEGAJO
 SET FILTER TO (IMPUESTO + DESCTADO) > 0  
 BROWSE
 