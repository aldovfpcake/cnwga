unidad = "g:"
SET PATH TO &unidad\nwga\forms;&unidad\nwga\datos;&unidad\nwga\prg


OPEN DATABASE GANANCIAS VALIDATE
SET PROCEDURE TO &unidad\nwga\prg\crypta
UPDATE netsu;
       SET nombre  = desencrip(nombre),;
           pasword = desencrip(pasword)


SELECT netsu
*USE
*DO WLOGIN