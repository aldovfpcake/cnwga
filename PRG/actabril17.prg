SET EXCLUSIVE OFF
SET PATH TO F:\SUELDOS\EMPRE1

SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" ORDER BY LEGAJO INTO CURSOR LISTA 
*tot = 0
*fso = CreateObject('Scripting.FileSystemObject')
*tf = fso.CreateTextFile('c:\testfile.txt', .t.)


SCAN

 VarLegajo = lista.legajo
 ?STR(lista.legajo,4) + " "+ lista.nombre 
* devolucion()
 sumar()
 remple()
 SELECT lista
 
 *Result = dosb.r2 - uno.r1
 *Result =  Result - (Result*2)
* IF Result < 0
*    At = "**"
* ELSE   
*    At = " "
* ENDIF   
     
* linea = STR(lista.legajo,4) + " "+ lista.nombre + " "+ STR(Result,12,2) + At 
* tf.WriteLine(linea) 
ENDSCAN
*linea = "Total............:" + STR(tot,12,2)
*tf.WriteLine(linea)

*tf.Close


***********************
FUNCTION SUMAR
**********************
 SELECT FEBRERO AS Totreten;
 FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2020 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 600;
 INTO CURSOR INFTOT
 
 *SELECT JULIO AS Ttaren;
 *FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2017 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 602;
 *INTO CURSOR ARET
 
 
 
 RETURN .T.



************************
FUNCTION REMPLE
******************
Vsaldo =0
*IF aret.Ttaren < 0 
*   Vsaldo = aret.Ttaren + inftot.Totreten 
*ELSE
*   Vsaldo = inftot.Totreten - aret.Ttaren
*ENDIF
*tot = tot + Vsaldo
*linea = STR(lista.legajo,4) +" "+ lista.nombre + "  " + STR(Vsaldo,10,2)
*tf.WriteLine(linea)
*SELECT MAYO FROM NLEGAJO WHERE EMPRESA = 1 .AND. ANO = 2018 .AND. CONCEPTO = 605;
INTO CURSOR EXISTE

*IF EXISTE.MAYO <> 0
*   RETURN .T.
*ENDIF


*Resultado = 0
*Resultado = dosb.r2 - uno.r1

*IF Resultado > 0
*   Vsaldo =  Resultado - (Resultado*2) 
*ELSE
*   Vsaldo = 0
*ENDIF   


Vsaldo =inftot.Totreten
*tot = tot + inftot.Totreten
UPDATE NLEGAJO SET FEBRERO = Vsaldo;
WHERE EMPRESA = 1 .AND. ANO = 2020 .AND. LEGAJO = VarLegajo .AND. CONCEPTO = 605
RETURN .T.    
     
     
     
********************************************************
FUNCTION DEVOLUCION
***************************************************     

select legajo,sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto+setiembre) as r1;
from nlegajo where empresa = 1 .and. ano = 2019 .and.legajo =Varlegajo .and. concepto = 600;
group by legajo into cursor uno



select legajo,sum(enero+febrero+marzo+abril+mayo+junio+julio+agosto) as r2;
from nlegajo where empresa = 1 .and. ano = 2019 .and.legajo =VarLegajo .and. concepto = 605;
group by legajo into cursor dosb

RETURN .T.

