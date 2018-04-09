
SET DELETED ON            
SET PATH TO F:\SUELDOS\EMPRE1 ;F:\SUELDOS\NWGA\DATOS           

*SELECT p.legajo,p.nombre,s.importe,p.depart,i.legajo;
from personal p INNER JOIN saldo2017 s;
ON p.legajo = s.legajo ORDER BY p.depart



*SELECT nlegajo.diciembre FROM nlegajo WHERE concepto = 310 .and. ano = 2017 
*UPDATE NLEGAJO SET DICIEMBRE = 51967 WHERE CONCEPTO = 310 .AND. ANO = 2017



*SELECT  Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre;
			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = 729;
   			AND  Nlegajo.empresa = 1;
   			AND  Nlegajo.ano = 2017;
            AND  INLIST( Nconceptos.clase,1);
            INTO CURSOR informe


SELECT p.legajo,p.nombre,p.depart,s.importe,i.legajo;
from personal p INNER JOIN saldo2017 s;
ON p.legajo = s.legajo;
LEFT JOIN IMPORTAC i ;
ON s.legajo = i.legajo
