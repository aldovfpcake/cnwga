SET PROCEDURE TO c:\cnwga\prg\clasfg

x   = CREATEOBJECT("CALCULORET")
x.mes = 4
x.LEGAJO = 441
	X.CALCURET  
	*X.DEDUPER  
	X.ACTUIMPOACARGO
	IF x.cancelar <> .t.
   		X.CALCUGNETA 
   		X.CALCURETEN
	endif
