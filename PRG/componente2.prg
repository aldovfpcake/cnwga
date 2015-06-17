SELECT GANCIAS
CLEAR
VarPjte = 0.25
FOR m= 5 TO 16
  ?FIELD(m)
   campo = FIELD(m)
   ?CHR(13)
   GO top
   FOR i = 1 TO RECCOUNT()
      
       
       
       IF concepto = 600
          valor = 0
          ? campo + " " +STR(concepto,6,2) + "-->" + STR(&campo,12,2) 
          valor = &campo
         
         
         * actualizar(campo,concepto,valor)
         *replace &campo WITH valor                     
       ENDIF   
       
       IF CONCEPTO = 605
           ? " Reemplazando  Valor  =" + STR(valor,12,2) 
          replace &campo WITH valor
       ENDIF   
       
       
          
       ?CHR(13) 
       
      
      
       skip
   next
   
next  





