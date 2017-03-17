SET EXCLUSIVE OFF
OPEN DATABASE f:\sueldos\nwga\datos\ganancias.dbc SHARED
SET PROCEDURE TO c:\cnwga\prg\clasdatos

x = CREATEOBJECT('datos',212,2016)
clear
Vartot = x.RemuTotalAnual()
?Vartot
Vartobra = x.ObraSocTotal()
?Vartobra
VarTotJubi = x.JubiTotal()
?VarTotJubi