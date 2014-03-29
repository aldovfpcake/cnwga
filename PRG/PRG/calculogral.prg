
SET EXCLUSIVE OFF
SET DATE ITALIAN
SET PATH TO C:\SUERUT\EMPRE1
SET PROCEDURE TO C:\cnwga\prg\clasfg
OPEN DATABASE F:\SUELDOS\NWGA\DATOS\GANANCIAS SHARED
wmes = 5
CLEAR
SELECT LEGAJO,NOMBRE FROM C:\SUERUT\EMPRE1\PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO;
INTO ARRAY VPER
SELECT PERSONAL
USE
LOCAL parmlg as integer
FOR I=1  TO ALEN(VPER,1)
    WAIT WINDOW "Calculando : " + STR(VPER(I,1),4) 
   parmleg =VPER(I,1)
   CALCULAR(parmleg,wmes) 
NEXT

*****************
FUNCTION CALCULAR
*****************
PARAMETERS leg,wmes
 x   = CREATEOBJECT("CALCULORET") 

IF .NOT. USED("gancias")
   		SELECT 0
   		parno      = 2011
   		parlegajo  = leg
   		parempresa = 1  
   		USE GANCIAS
	ELSE 
   		SELECT GANCIAS
   		parno      = 2011
   		parlegajo  = leg
   		parempresa = 1
   		REQUERY()
       
	ENDIF
   
	X.MES = wmes
	X.CALCURET  
	X.DEDUPER  
	X.CALCUGNETA 
	X.CALCURETEN

RELEASE X

RETURN .T.