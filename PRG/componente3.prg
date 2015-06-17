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
          var600 =0
          var600 = &campo
       ENDIF  
         
         * actualizar(campo,concepto,valor)
         *replace &campo WITH valor                     
         
       
       IF CONCEPTO = 605
           var605 = 0
           var605 = &campo 
          *replace &campo WITH valor
       ENDIF   
       
       IF CONCEPTO = 607
          replace &campo WITH var605 - var600
       ENDIF    
          
          
          
       ?CHR(13) 
       
      
      
       skip
   next
   
next  





