SET PATH TO F:\SUELDOS\NWGA\DATOS
SELECT enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,;
octubre,noviembre,diciembre from deducciones where concepto = 300 into cursor valordedu


SELECT LEGAJO FROM NLEGAJO WHERE ANO = 2013 .AND. CONCEPTO = 300 INTO CURSOR lista

SCAN
    UPDATE NLEGAJO SET enero    = valordedu.enero,;
                      febrero  = valordedu.febrero,;      
                      marzo    = valordedu.marzo,;
                      abril    = valordedu.abril,;
                      mayo     = valordedu.mayo,;
                      junio    = valordedu.junio,;
                      julio    = valordedu.julio,;
                      agosto   = valordedu.agosto,;
                      setiembre= valordedu.setiembre,;
                      octubre  = valordedu.octubre,;
                      noviembre= valordedu.noviembre,;
                      diciembre= valordedu.diciembre;
                      WHERE legajo = lista.legajo .and. concepto = 300 .and. ano =2013


ENDSCAN