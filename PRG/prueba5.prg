SET EXCLUSIVE OFF
OPEN DATABASE f:\sueldos\nwga\datos\ganancias.dbc SHARED
SET PROCEDURE TO c:\cnwga\prg\clasfg
x = CREATEOBJECT('cargobase')
x.wLEGAJO = 445
x.wEMPRESA = 1
x.wAÑO = 2015
x.carga