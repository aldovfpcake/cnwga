SET EXCLUSIVE OFF
SET DATE ITALIAN
SET PATH TO C:\SUERUT\EMPRE1
SET DELETED ON
SET PROCEDURE TO C:\cnwga\prg\clasfg





SELECT 1
SELECT LEGAJO FROM PERSONAL;
WHERE ACTIVO = "A"  ORDER BY LEGAJO INTO CURSOR NOMINA READWRITE
GO BOTTOM
ULTIMO = NOMINA.LEGAJO
GO TOP


*************
*MES A CALCULAR


















































































































































































































































































































































































wmes = 7
**************
SELECT NOMINA
DO WHILE .NOT. EOF()
    *WAIT WINDOW "CALCULANDO NOMINA  LEGAJO:" + STR(NOMINA.LEGAJO,4) + "REGISTRO...:" + STR(RECNO(),4) NOWAIT
    x   = CREATEOBJECT("CALCULORET")
	*ofam = CREATEOBJECT("OFAMILIA")
	*ofam.olegajo = nomina.legajo
	*ofam.oempresa = 1 
	*ofam.existe
	*ofam.busco
	
	
	IF .NOT. USED("gancias")
   		SELECT 0
   		parno      = 2011
   		parlegajo  = nomina.legajo
   		parempresa = 1  
   		USE GANCIAS
	ELSE 
   		SELECT GANCIAS
   		parno      = 2011
   		parlegajo  = nomina.legajo
   		parempresa = 1
   		REQUERY()
       
	ENDIF
   
	X.MES = wmes
	X.CALCURET  
	X.DEDUPER  
	X.CALCUGNETA 
	X.CALCURETEN
	*
	*------------------------------
	*X.AGRECONYUGE
	*IF ofam.oesposa <> 0
   *		X.AGRECONYUGE
   *	ENDIF

	*IF ofam.ocanthijos <>0
   	*	X.FILIO  = ofam.ocanthijos
   *		X.AGREHIJO
   *	ENDIF   
   
     ? NOMINA.LEGAJO
    SELECT NOMINA
    IF NOMINA.LEGAJO + 1 > ULTIMO 
       EXIT 
	ENDIF
	
	IF .NOT. EOF() 
	    SKIP
	ELSE
	   EXIT
	ENDIF   
	RELEASE x
	*RELEASE ofam

ENDDO
WAIT WINDOW "PROCESO TERMINADO"
CLOSE TABLES
USE	