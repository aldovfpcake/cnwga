SET PROCEDURE TO g:\nwga\PRG\CLASFG
LOCAL x
x = NEWOBJECT("conceptos")

USE NCONCEPTOS
SCAN
   WAIT WINDOW STR(concepto,4)
  x.codigo   = concepto
  x.ano      = 2010
  x.legajo   = 677
  x.empresa  = 1
  x.agregar
 
endscan
RELEASE x
