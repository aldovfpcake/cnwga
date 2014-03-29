SET EXCLUSIVE OFF
CLOSE TABLES ALL

OPEN DATABASE F:\SUELDOS\NWGA\DATOS\GANANCIAS SHARED
SET PROCEDURE TO g:\cnwga\prg\clasfg
SET PATH TO F:\SUELDOS\EMPRE1;F:\SUELDOS\NWGA\DATOS
SELECT 0
USE PERSONAL
objx = CREATEOBJECT("infoga")
objx.vempre = 1
objx.mes = 1
objx.vfecha = CTOD("31-01-2011")
objx.generar
*objx.exporta
*x.expcel = 0
*X.exptotxt = 1

*x.aexcel
RELEASE objx