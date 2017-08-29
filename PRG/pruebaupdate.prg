 CLEAR
*xlegajo = 12
* DO
*   CASE xlegajo < 100
*        wleg = STR(xlegajo,2) 
*  CASE  xlegajo > 100
*        wleg = STR(xlegajo,3)
* ENDCASE        
 wleg = 840 
 wimporte = 4712.22
 DIMENSION meses(12)
 meses(1) = "ENERO"
 meses(2) = "FEBRERO"
 meses(3) = "MARZO" 
 meses(4) = "ABRIL"
 meses(5) = "MAYO"
 meses(6) = "JUNIO"
 meses(7) = "JULIO"
 meses(8) = "AGOSTO"
 meses(9) = "SETIEMBRE"
 meses(10)= "OCTUBRE"
 meses(11)= "NOVIEMBRE" 
 meses(12)= "DICIEMBRE"
 
 cadena = " "
 FOR i = 8 TO  12
     IF i=12
        cadena = cadena + meses(i)+"= wimporte"
     ELSE
       cadena = cadena + meses(i) +"= wimporte"+","

     ENDIF
     
 
 NEXT
 nwsql = "UPDATE nlegajo set" 
 finsql = " WHERE LEGAJO =wleg AND CONCEPTO =362 AND ANO =2017"
 csql =nwsql +cadena +finsql
 ? csql
 &csql
 
 
   
   
