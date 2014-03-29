SET PATH TO F:\SUELDOS\NWGA\DATOS
SELECT enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,;
octubre,noviembre,diciembre from deducciones where concepto = 310 into cursor valorimpo


SELECT LEGAJO FROM NLEGAJO WHERE ANO = 2013 .AND. CONCEPTO = 310 INTO CURSOR lista

SCAN
    UPDATE NLEGAJO SET enero    = valorimpo.enero,;
                      febrero  = valorimpo.febrero,;      
                      marzo    = valorimpo.marzo,;
                      abril    = valorimpo.abril,;
                      mayo     = valorimpo.mayo,;
                      junio    = valorimpo.junio,;
                      julio    = valorimpo.julio,;
                      agosto   = valorimpo.agosto,;
                      setiembre= valorimpo.setiembre,;
                      octubre  = valorimpo.octubre,;
                      noviembre= valorimpo.noviembre,;
                      diciembre= valorimpo.diciembre;
                      WHERE legajo = lista.legajo .and. concepto = 310 .and. ano =2013


ENDSCAN