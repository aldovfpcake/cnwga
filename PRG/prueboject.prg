
*PARAMETERS vvleg
SET PROCEDURE TO c:\nwga\PRG\CLASFG
* e:\nwga\prg\crypta
*x = NEWOBJECT("encri")
*x.legajo = vvleg
*x.empresa = 1
* LOCAL streamco as String
*  streamco = encri("Aldo")
*  desencrip(streamco)

*x.ano = 2010
*x.codigo = 600
*x.agregar

x = NEWOBJECT("ACTUCONP")
x.codigo = 1
x.mes = 30
x.cancelar = .t.

RELEASE X




return