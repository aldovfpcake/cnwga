SET EXCLUSIVE OFF
SET DELETED ON
SET PATH TO F:\SUELDOS\EMPRE1;c:\CNWGA\FORMS
OPEN DATABASE f:\sueldos\nwga\datos\ganancias SHARED VALIDATE
***********************
WNUMES = 3
VVARCHIVO = "32019"    
*************************
USE saldo2017

GO top

*x =GETPRINTER()
*REPORT FORM RPMENSUAL TO PRINTER PROMPT
SUM importe TO VV
?"TOTAL RETENIDO" + " " + STR(VV,14,2)
WAIT WINDOW" "

SCAN
 verifica()
 
ENDSCAN
descuento() 

WAIT WINDOW "Proceso Terminado"




************
FUNCTION DESCUENTO()
************
SELE SALDO2017
GO TOP
SCAN
    
    SELECT CONCEPTO FROM &VVARCHIVO WHERE LIQUIDA = 3 .AND. CONCEPTO = 654.AND.LEGAJO = SALDO2017.LEGAJO INTO CURSOR EXISTE
    SELECT EXISTE
    IF EOF()   
         
        INSERT INTO &VVARCHIVO (LEGAJO,CONCEPTO,DESCRIP,DESCUENTO,LIQUIDA) VALUES(SALDO2017.LEGAJO,654,"Saldo Imp Gan 2017",SALDO2017.IMPORTE,3)
    ELSE
        UPDATE &VVARCHIVO SET DESCUENTO = SALDO2017.IMPORTE  WHERE LEGAJO = SALDO2017.LEGAJO .AND. LIQUIDA = 3.AND. CONCEPTO = 654  
    ENDIF
   
            
ENDSCAN
CLOSE TABLES all
WAIT WINDOW "PROCESO TERMINADO"

RETURN .T.



****************************
FUNCTION VERIFICA
****************************
SELECT LEGAJO,SUM(APORTE) + SUM(SINAPORTE) - SUM(DESCUENTO) AS NETO  FROM &VVARCHIVO  WHERE LIQUIDA = 3 .AND.   LEGAJO = saldo2017.legajo ;
GROUP BY LEGAJO INTO CURSOR sueldo
?legajo
IF sueldo.neto < saldo2017.importe
   MESSAGEBOX( STR(saldo2017.importe,4) + " " + "Desc Ganancias Mayor a Sueldo",16,"Atención")
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
   nom  = 'Error en número de Período'
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
   nom  = 'Error en número de Período'
else  
   nom  = meses(wmes) 
endif   
nom = 'N.'+nom
return nom






