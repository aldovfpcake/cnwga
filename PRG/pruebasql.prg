SET PATH TO F:\SUELDOS\EMPRE1;F:\SUELDOS\NWGA\DATOS
SET DELETED ON
SELECT nlegajo.legajo, nlegajo.diciembre FROM nlegajo n; 
INNER JOIN personal p on p.legajo  = n.legajo;
WHERE concepto = 310;
.and. ano = 2017 .and. nlegajo.diciembre <> 51967;
.and. p.activo  ="A"
