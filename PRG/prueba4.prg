SET EXCLUSIVE OFF
SET DELETED ON
SET PATH TO c:\SUERUT\EMPRE1;c:\CNWGA\FORMS
WMES = "MAYO"
WNUMES = 6
        
WCAMP = RET(WNUMES)
WAIT WINDOW WCAMP
SELECT N.LEGAJO,P.NOMBRE,P.FECHABAJA,PS261,&WCAMP AS RET    FROM PERSONAL AS P INNER JOIN NLEGAJO AS N;
ON P.LEGAJO = N.LEGAJO WHERE ANO = 2014 .AND. N.CONCEPTO = 600  ORDER BY RET,N.LEGAJO;
INTO CURSOR INFR READWRITE
*BROWSE
SET FILTER TO RET <>0
WMES = " "
WMES = WCAMP
*x =GETPRINTER()
*REPORT FORM RPMENSUAL TO PRINTER PROMPT
descuento()




************
FUNCTION DESCUENTO()
************

GO TOP
VVARCHIVO ="62014"

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






