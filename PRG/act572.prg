PARAMETERS WLEGAJO,WUNIDADES
*SET EXCLUSIVE OFF
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
USE NLEGAJO AGAIN
*CLEAR
*WLEGAJO = 565
*48447 ESPOSA CONCEPTO = 320
*24432 HIJO   CONCEPTO = 330

 
WIMPORTE  = 24432
WCONCEPTO = 330
*WUNIDADES = 1
clear
campo = FIELD(9)
indi = 9

















FUNCTION viejo


clear
FOR I=5  TO 12
      
      wimpo =((WIMPORTE/12)*I)*WUNIDADES
      ?STR(WLEGAJO,4)+ " "+campo + " " + STR( wimpo,10,2) 
      
      UPDATE NLEGAJO SET &campo=wimpo;
      WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = WLEGAJO .AND. CONCEPTO = WCONCEPTO                
      
      indi =indi+1
      campo = FIELD(indi)
      *?indi
      *?FIELD(indi)
      *?((WIMPORTE/12)*I)
NEXT

*BROWSE FOR EMPRESA=1 .AND. ANO = 2017 .AND. LEGAJO = WLEGAJO
RETURN .t





















