SELECT 0
USE SUELDOS2013 ALIAS SU
SCAN
   ? SU.LEGAJO
   UPDATE C:\SUERUT\EMPRE1\PERSONAL SET NIVELGCIA = SU.NIVEL ;
   WHERE SU.LEGAJO = PERSONAL.LEGAJO
   SELECT SU 
      
ENDSCAN