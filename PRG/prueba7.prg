SET EXCLUSIVE OFF
SET PATH TO F:\SUELDOS\EMPRE1
select legajo, sum(iif(CONCEPTO=6,aporte,0)) AS FERI,;
sum(iif(CONCEPTO=6.or. CONCEPTO =9,cantidad,0)) AS cant from 22017 where legajo = 422 GROUP BY legajo;
INTO CURSOR FERIADO
BROWSE
horas = (FERIADO.FERI/FERIADO.CANT)*8
horasfe = horas - (horas*2)
?horasfe