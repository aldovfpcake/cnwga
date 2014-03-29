SET PATH TO F:\SUELDOS\NWGA\DATOS
SELECT enero,febrero,marzo,abril,mayo,junio,julio,agosto,setiembre,;
octubre,noviembre,diciembre from deducciones where concepto = 350 into cursor valorcgo

SELECT 0
SELECT legajo,cntcg FROM famcargo WHERE cntcg <>0 INTO CURSOR curacg
CLEAR
SCAN
   ?curacg.legajo
   
   
*TRY
   UPDATE NLEGAJO SET enero    = valorcgo.enero*curacg.cntcg,;
                      febrero  = valorcgo.febrero*curacg.cntcg,;      
                      marzo    = valorcgo.marzo*curacg.cntcg,;
                      abril    = valorcgo.abril*curacg.cntcg,;
                      mayo     = valorcgo.mayo*curacg.cntcg,;
                      junio    = valorcgo.junio*curacg.cntcg,;
                      julio    = valorcgo.julio*curacg.cntcg,;
                      agosto   = valorcgo.agosto*curacg.cntcg,;
                      setiembre= valorcgo.setiembre*curacg.cntcg,;
                      octubre  = valorcgo.octubre*curacg.cntcg,;
                      noviembre= valorcgo.noviembre*curacg.cntcg,;
                      diciembre= valorcgo.diciembre*curacg.cntcg;
                      WHERE legajo = curacg.legajo .and. concepto = 350 .and. ano =2013    
                      
 * CATCH TO E
 *      WAIT WINDOW "ERRO EN DEDUCCIONES PERSONALES " + STR(ERROR(),4)
      
 * ENDTRY
endscan