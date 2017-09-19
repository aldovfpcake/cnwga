SET EXCLUSIVE OFF
SET DELETED ON
SET PATH TO F:\SUELDOS\EMPRE1;c:\CNWGA\FORMS
OPEN DATABASE f:\sueldos\nwga\datos\ganancias SHARED VALIDATE
***********************
WNUMES = 8
VVARCHIVO = "82017"    
*************************
CLEAR    
WCAMP = RET(WNUMES)
WAIT WINDOW WCAMP
SELECT N.LEGAJO,P.NOMBRE,P.FECHABAJA,PS261,&WCAMP AS RET    FROM PERSONAL AS P INNER JOIN NLEGAJO AS N;
ON P.LEGAJO = N.LEGAJO WHERE ANO = 2017 .AND. N.CONCEPTO = 605  ORDER BY RET,N.LEGAJO;
INTO CURSOR INFR READWRITE
SELECT INFR
*BROWSE
SET FILTER TO RET <>0
WMES = " "
WMES = WCAMP
*x =GETPRINTER()
*REPORT FORM RPMENSUAL TO PRINTER PROMPT
SUM RET TO VV
?"TOTAL RETENIDO" + " " + STR(VV,14,2)
WAIT WINDOW" "
SELECT INFR
SCAN
 verifica()
 

ENDSCAN
descuento()
WAIT WINDOW "Proceso Terminado"




************
FUNCTION DESCUENTO()
************

GO TOP
SCAN
    
    SELECT CONCEPTO FROM &VVARCHIVO WHERE LIQUIDA = 3 .AND. CONCEPTO = 130.AND.LEGAJO = INFR.LEGAJO INTO CURSOR EXISTE
    SELECT EXISTE
    IF EOF()   
         
        INSERT INTO &VVARCHIVO (LEGAJO,CONCEPTO,DESCRIP,DESCUENTO,LIQUIDA) VALUES(INFR.LEGAJO,130,"Imp.A las Gananc",INFR.RET,3)
    ELSE
        UPDATE &VVARCHIVO SET DESCUENTO = INFR.RET WHERE LEGAJO = INFR.LEGAJO .AND. LIQUIDA = 3.AND. CONCEPTO = 130  
    ENDIF
   SELECT INFR
            
ENDSCAN
CLOSE TABLES all
WAIT WINDOW "PROCESO TERMINADO"

RETURN .T.



****************************
FUNCTION VERIFICA
****************************
SELECT LEGAJO,SUM(APORTE) + SUM(SINAPORTE) - SUM(DESCUENTO) AS NETO  FROM &VVARCHIVO  WHERE LIQUIDA = 3 .AND.   LEGAJO = infr.legajo ;
GROUP BY LEGAJO INTO CURSOR sueldo
?legajo
IF sueldo.neto < infr.ret
   MESSAGEBOX( STR(infr.legajo,4) + " " + infr.nombre + " " + "Desc Ganancias Mayor a Sueldo",16,"Atenci�n")
ENDIF
RETURN .T.    
 











FUNCTION RET()
parameters wmes

NMBES = " "

nom = space(12)

DECLARE MESES (12)

MESES(1)  = 'ENERO'
MESES(2)  = 'FEBRERO'
MESES(3)  = 'MARZO'
MESES(4)  = 'ABRIL'
MESES(5)  = 'MAYO'
MESES(6)  = 'JUNIO'
MESES(7)  = 'JULIO'
MESES(8)  = 'AGOSTO'
MESES(9)  = 'SETIEMBRE'
MESES(10) = 'OCTUBRE'
MESES(11) = 'NOVIEMBRE'
MESES(12) = 'DICIEMBRE'

if wmes = 0 .or. wmes > 12
   nom  = 'Error en n�mero de Per�odo'
else  
   nom  = meses(wmes) 
endif   
nom = 'N.'+nom
return nom


FUNCTION  NUEVARET()
parameters wmes

NMBES = " "

nom = space(12)

DECLARE MESES (12)

MESES(1)  = 'ENERO'
MESES(2)  = 'FEBRERO'
MESES(3)  = 'MARZO'
MESES(4)  = 'ABRIL'
MESES(5)  = 'MAYO'
MESES(6)  = 'JUNIO'
MESES(7)  = 'JULIO'
MESES(8)  = 'AGOSTO'
MESES(9)  = 'SETIEMBRE'
MESES(10) = 'OCTUBRE'
MESES(11) = 'NOVIEMBRE'
MESES(12) = 'DICIEMBRE'

if wmes = 0 .or. wmes > 12
   nom  = 'Error en n�mero de Per�odo'
else  
   nom  = meses(wmes) 
endif   
nom = 'N.'+nom
return nom






