SET PATH TO F:\SUELDOS\EMPRE1
SELECT p.legajo,p.nombre,n.abril FROM personal p INNER JOIN nlegajo n;
on p.legajo = n.legajo WHERE n.concepto = 600 .and. ano = 2017 ORDER BY p.legajo
browse