SET DELETED ON

SELECT 0
*USE SALDO2017
clear
SELECT legajo,importe FROM saldo2019 WHERE importe < 1 .and. importe <>0 INTO CURSOR lista
SCAN
     SELECT legajo,reten FROM infofin WHERE legajo = lista.legajo INTO CURSOR existe
     ? existe.reten
     ? lista.importe
       positivo = lista.importe*1
       IF positivo > existe.reten
           saldo =  existe.reten - (lista.importe*-1) 
           
       ELSE
            saldo = (lista.importe*-1) - existe.reten
            saldo = saldo*-1
       ENDIF  
     
      ?saldo
     WAIT " "
     UPDATE infofin SET reten = saldo WHERE legajo = existe.legajo
     SELECT lista     
      
      
      
ENDSCAN     