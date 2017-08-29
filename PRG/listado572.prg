SET PATH TO F:\SUELDOS\EMPRE1
SELECT p.legajo,p.nombre,p.depart,i.legajo;
from personal p LEFT JOIN importac i ON i.legajo = p.legajo WHERE p.activo = "A" .and. ISNULL(i.legajo);
order BY p.depart,p.legajo
*SET FILTER TO ISNULL(legajo_b)
*browse

COPY TO c:\suerut\listados\572B.xls TYPE XLS