
SET PATH TO g:\SUERUT\EMPRE1
 mes = "julio"
SELECT legajo,SUM(IIF(CLASE= 1 .OR. CLASE = 8,&MES,0))AS BASELQ,SUM(IIF(CONCEPTO = 500 ,&mes,0))as &mes ,SUM(IIF(CONCEPTO = 500 ,&mes,0))- SUM(IIF(CONCEPTO = 510 ,&mes,0)) as ret  FROM nlegajo;
WHERE ano = 2010 GROUP BY legajo INTO CURSOR RETCUA
 
SELECT R.LEGAJO,P.NOMBRE,P.CUIL,P.CALLE,;
P.NRO,P.LOCALIDAD,P.PROVINCIA, R.BASELQ,R.RET FROM PERSONAL AS P  INNER JOIN RETCUA  AS R ON p.legajo = r.legajo ORDER BY r.legajo INTO CURSOR INFR
 
SELECT  n.legajo, n.concepto,abril,c.clase  FROM nlegajo as n INNER JOIN nconceptos;
as c ON c.concepto = n.concepto WHERE N.ANO = 2010 .AND. C.CLASE = 1 ORDER BY n.legajo INTO CURSOR HABER   
BROWSE 
SELECT legajo,SUM(abril) AS HAB FROM HABER WHERE clase = 1    GROUP BY  legajo INTO CURSOR BASE 


SELECT  n.legajo, n.concepto,abril,c.clase  FROM nlegajo as n INNER JOIN nconceptos;
as c ON c.concepto = n.concepto WHERE N.ANO = 2010 .AND. C.CLASE = 8 ORDER BY n.legajo INTO CURSOR SINAPORTE


SELECT legajo,SUM(abril) AS HSAP FROM SINAPORTE WHERE clase = 8    GROUP BY  legajo INTO CURSOR SINAP 

SELECT base.legajo,base.hab AS HABER ,sinap.hsap AS VIATICO from base INNER JOIN sinap ON base.legajo = sinap.legajo;
INTO CURSOR sueldo



SELECT INFR.LEGAJO,INFR.NOMBRE,INFR.CUIL,INFR.CALLE,;
INFR.NRO,INFR.LOCALIDAD,INFR.PROVINCIA, INFR.RET,SUELDO.HABER,SUELDO.VIATICO;
FROM INFR INNER JOIN SUELDO  ON SUELDO.LEGAJO = INFR.LEGAJO   

BROWSE





FUNCTION aporte
LOCAL sueldo
sueldo =0 
IF concepto = 1
     sueldo = sueldo + abril
ENDIF

RETURN sueldo     



