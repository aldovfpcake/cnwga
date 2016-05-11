SET DELETED ON

SELECT Legajo,Descuento from f:\sueldos\empre1\22016 where concepto = 130 order by legajo into cursor rt

VarAcu =0
SCAN
    Select legajo from f:\sueldos\nwga\datos\dve where dve.legajo = rt.legajo;
	into cursor existe
	if eof()
	   insert into dve(legajo,concepto,reten) values(rt.legajo,130,rt.descuento)
	else
      
      update dve set reten = rt.descuento where rt.legajo = dve.legajo
    ENDIF
    SELECT rt
ENDSCAN	

WAIT WINDOW "Proceso Terminado"
	