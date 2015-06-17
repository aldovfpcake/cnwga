CLEAR
VarPjte = 0.25
FOR m= 5 TO 16
  ?FIELD(m)
   campo = FIELD(m)
   ?CHR(13)
   GO top
   FOR i = 1 TO RECCOUNT()
      
       ? campo + " " +STR(concepto,6,2) + "-->" + STR(&campo,12,2) 
       
       IF concepto = 300 .or. concepto = 310 .or. concepto = 320 .or. concepto = 330 .or. concepto = 350
          valor = &campo*VarPjte + &campo
          ? "  Valor Incrementado =" + STR(valor,12,2)  
         * actualizar(campo,concepto,valor)
         replace &campo WITH valor                     
       ENDIF      
       ?CHR(13) 
       
      
      
       skip
   next
   
next  





*************
FUNCTION actualizar
*******************

PARAMETERS Parcampo,ParConcepto,ParValor
? "ACT"
?Parcampo

     UPDATE GANCIAS SET &Parcampo = ParValor;
        WHERE CONCEPTO  = ParConcepto
 


