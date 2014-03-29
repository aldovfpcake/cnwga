SET PATH TO F:\SUELDOS\NWGA\DATOS
SELECT enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,;
octubre,noviembre,diciembre from deducciones where concepto = 330 into cursor valorhj

SELECT 0
SELECT legajo,cnthjo FROM hjos WHERE cnthjo <>0 INTO CURSOR cnthjo
CLEAR
SCAN
   ?cnthjo.legajo
   
   
*TRY
   UPDATE NLEGAJO SET enero    = valorhj.enero*cnthjo.cnthjo,;
                      febrero  = valorhj.febrero*cnthjo.cnthjo,;      
                      marzo    = valorhj.marzo*cnthjo.cnthjo,;
                      abril    = valorhj.abril*cnthjo.cnthjo,;
                      mayo     = valorhj.mayo*cnthjo.cnthjo,;
                      junio    = valorhj.junio*cnthjo.cnthjo,;
                      julio    = valorhj.julio*cnthjo.cnthjo,;
                      agosto   = valorhj.agosto*cnthjo.cnthjo,;
                      setiembre= valorhj.setiembre*cnthjo.cnthjo,;
                      octubre  = valorhj.octubre*cnthjo.cnthjo,;
                      noviembre= valorhj.noviembre*cnthjo.cnthjo,;
                      diciembre= valorhj.diciembre*cnthjo.cnthjo;
                      WHERE legajo = cnthjo.legajo .and. concepto = 330 .and. ano =2013    
                      
 * CATCH TO E
 *      WAIT WINDOW "ERRO EN DEDUCCIONES PERSONALES " + STR(ERROR(),4)
      
 * ENDTRY
endscan