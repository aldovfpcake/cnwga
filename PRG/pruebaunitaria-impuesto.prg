



clear
private sjtoaret = 7987.50 

VVARCHI = " "
DO WHILE EMPTY(VVARCHI)
   VVARCHI = INPUTBOX("Ingrese Monto a Calcuar","Ingrese",VVARCHI,5600)
ENDDO
sjtoaret = val(VVARCHI)


RNOMBREMS = " "
            RMESANTE  = " "
            retencion = 0
            retean = 0          
            SELECT * FROM NESCALA WHERE MES = 9 INTO CURSOR ESCALA
            SELECT escala
      
            DO WHILE .not. EOF()  
                IF escala.de < sjtoaret 
                   IF escala.a >= sjtoaret .or. escala.a = 0
                      WAIT WINDOW STR(ESCALA.PORCENTAJE,2) 
                      exit
                   ENDIF
                ENDIF   
                SKIP
            
            ENDDO
            
retencion = ((sjtoaret - escala.excedente)*escala.porcentaje/100) + escala.suma 
?sjtoaret
? "Retencion........" + STR(retencion,10,2) 