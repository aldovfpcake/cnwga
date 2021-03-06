*OPEN DATABASE f:\nwga\datos\ganancias.dbc SHARED
OPEN DATABASE C:\nwga\datos\ganancias
SET EXCLUSIVE OFF
SET DATE BRITISH 
SET CENTURY ON
*SET PATH TO f:\EMPRE1
SET PATH TO C:\SUERUT\EMPRE1
SELECT 0
IF USED("VPERSO")
   SELECT VPERSO 
ELSE   
   IF USED("PERSONAL")
      SELECT PERSONAL 
   ELSE
      SELECT 0
      *USE F:\EMPRE1\PERSONAL ALIAS VPERSO
       USE C:\SUERUT\EMPRE1\PERSONAL
  ENDIF 
ENDIF   
 CLEAR
*USE c:\suerut\empre1\personal ALIAS vperso*
*SELECT personal
*use
local mes as string
LOCAL vempre as Integer
LOCAL vvfecha as date 
 mes = "ABRIL"
 vempre =1
 CLEAR
vvfecha = CTOD("28/04/2021")
SELECT legajo,SUM(IIF(CLASE= 1 .OR. CLASE = 8,&MES,0))AS BASELQ,SUM(IIF(CONCEPTO = 500 ,&mes,0))as &mes ,SUM(IIF(CONCEPTO = 605,&mes,0)) as ret  FROM nlegajo;
WHERE ano = 2021 .AND. EMPRESA = vempre  GROUP BY legajo INTO CURSOR RETCUA
 SUM RET TO VV
 *?"eS reT" + STR(VV,12,2)
 
 SELECT legajo,concepto,&mes as reten from nlegajo WHERE ano =2021 .and. empresa = vempre .and. concepto =605 INTO cursor retmensual READWRITE

 *SELECT legajo,rt as reten FROM  f:\sueldos\retenciones INTO CURSOR retmensual
 *completar()
* jo  ORDER BY r.legajo INTO CURSOR INFR
SELECT R.LEGAJO,P.NOMBRE,P.CUIL,P.CALLE,;
P.NRO,P.LOCALIDAD,P.PROVINCIA, R.BASELQ,M.reten FROM PERSONAL AS P  INNER JOIN RETCUA  AS R ON p.legajo = r.legajo INNER JOIN retmensual AS M ;
ON m.legajo = r.legajo  ORDER BY r.legajo INTO CURSOR INFR
 
 
SELECT  n.legajo as legajo, n.concepto,&mes,c.clase,n.empresa  FROM nlegajo as n INNER JOIN nconceptos;
as c ON c.concepto = n.concepto WHERE N.ANO = 2021 .AND. C.CLASE = 1 .AND. n.EMPRESA = vempre ORDER BY n.legajo INTO CURSOR HABER   

SELECT legajo,SUM(&mes) AS HABER FROM HABER WHERE clase = 1 GROUP BY  legajo INTO CURSOR BASE 


SELECT  n.legajo, n.concepto,&mes,c.clase,n.empresa  FROM nlegajo as n INNER JOIN nconceptos;
as c ON c.concepto = n.concepto WHERE N.ANO = 2021 .AND. EMPRESA= vempre .AND. C.CLASE = 8 ORDER BY n.legajo INTO CURSOR SINAPORTE


SELECT legajo,SUM(&mes)AS HSAP FROM SINAPORTE WHERE clase = 8   GROUP BY  legajo INTO CURSOR SINAP 

SELECT base.legajo,base.haber AS HABER ,sinap.hsap AS VIATICO from base INNER JOIN sinap ON base.legajo = sinap.legajo;
INTO CURSOR sueldo



SELECT INFR.LEGAJO,INFR.NOMBRE,INFR.CUIL AS CUIL,INFR.CALLE,;
INFR.NRO,INFR.LOCALIDAD,INFR.PROVINCIA, INFR.RETEN,SUELDO.HABER,SUELDO.VIATICO;
FROM INFR INNER JOIN SUELDO  ON SUELDO.LEGAJO = INFR.LEGAJO INTO CURSOR INFOFIN READWRITE
GO TOP
*devolu()
*BROWSE


*SELECT legajo,concepto,&mes FROM nlegajo WHERE concepto = 605;
AND ano = 2018 .and. empresa =1 ORDER BY legajo INTO CURSOR two
*clear
*SUM &mes TO vv
*WAIT WINDOW "two " + STR(vv,12,2)
*? "two ="
*?  vv


SELECT INFOFIN
SCAN
   VARCUIL =PASOCUIL(INFOFIN.CUIL)
   REPLACE INFOFIN.CUIL WITH VARCUIL
*   SELECT  LEGAJO,&MES FROM TWO WHERE INFOFIN.LEGAJO = TWO.LEGAJO INTO CURSOR EXISTE
*   IF .NOT.EOF()
*      ? STR(EXISTE.LEGAJO,4) + " "+ STR(EXISTE.&MES,12,2)
*      REPLACE INFOFIN.RET WITH EXISTE.&MES
*   ELSE
*      WAIT WINDOW "NO ENCONTRADO " +STR(TWO.LEGAJO,4)
*   ENDIF   
*   SELECT INFOFIN   
      
ENDSCAN
SELECT INFOFIN
GO TOP
SET FILTER TO reten <>0
SUM RETEN TO VV
WAIT WINDOW "Retención General ..............:"+ STR(VV,10,2)
BROWSE
*COPY TO "c:\suerut\listados\ganancias-marzo-2021.xls" TYPE XL5
*SET FILTER TO reten >0
*TRY
*      COPY TO GETFILE('XLS', 'Guardar archivo .XLS:',   'Guardar', 1, 'Guardar reporte en...') type XL5 *
*CATCH TO excepc
*       WAIT WINDOW "Error " + excepc.Message        *

*ENDTRY
BROWSE TITLE "LISTO"
*exporta(vvfecha) 
*CLOSE TABLES ALL
RETURN

FUNCTION aporte
LOCAL sueldo
sueldo =0 
IF concepto = 1
     sueldo = sueldo + &mes
ENDIF

RETURN sueldo     


***************
FUNCTION EXPORTA
****************
PARAMETERS vvfecha
*vvfecha = DATE()

SET DEVICE TO SCREEN
DELETE FILE "F:\DGIB.TXT"
SET DEVICE TO FILE "F:\DGIB.TXT"

WCOMPRO = " "
lin = 0
SELECT INFOFIN
SET FILTER TO RETEN <> 0 
GO TOP
DO WHILE .NOT. EOF()
   IF RETEN > 0
      @LIN,0  SAY "07" 
   ELSE
      @LIN,0  SAY "08"  
      LOCAL importe as Number
      importe = 0
      importe = ABS(RETEN)
      REPLACE RETEN WITH IMPORTE
    ENDIF
   
   @LIN,2  SAY vvfecha
  IF LEGAJO < 10
      WCOMPRO =  IIF (LEGAJO< 100,LTRIM(STR(MONTH(vvfecha),2))+"01"+ LTRIM(STR(LEGAJO,4)),LTRIM(STR(MONTH(vvfecha),2)) + LTRIM(STR(LEGAJO,4)))
  ELSE
      WCOMPRO =  IIF (LEGAJO< 100,LTRIM(STR(MONTH(vvfecha),2))+"1"+ LTRIM(STR(LEGAJO,4)),LTRIM(STR(MONTH(vvfecha),2)) + LTRIM(STR(LEGAJO,4)))
  ENDIF
   
   *+ STR(LEGAJO,4)
   @LIN,12 SAY WCOMPRO
   *            123456798-123456    
   @LIN,28  SAY "0000000000000.00"
   @LIN,44  SAY "787"
   @LIN,47  SAY "160"
   @LIN,50  SAY "1"
   *BASE DE CALCULO
   *             123456789-1234    
   *@LIN,51  SAY "00000000000.00"
   @LIN,51  SAY RETEN PICTURE "99999.99"
   @LIN,65  SAY vvfecha picture "!!/!!/!!!!"
   @LIN,75  SAY "01"
   @LIN,77  SAY "0"
   @LIN,78  SAY RETEN PICTURE "99999.99"
   @LIN,92  SAY "000000"
   @LIN,98  SAY " "
   @LIN,108 SAY "86"
   @LIN,110 SAY CUIL
   @LIN,130 SAY "0000000000000"
   @LIN,144 SAY " "
   @LIN,174 SAY "0"
   @LIN,175 SAY " "
   @LIN,186 SAY " "  
    SKIP
    LIN = LIN + 1
ENDDO

SET DEVICE TO SCREEN
SET SAFETY OFF
*FCLOSE("C:\SUERUT\EMPRE1\DGI.TXT")

MODIFY FILE F:\DGIB.TXT







******************
FUNCTION PASOCUIL
*****************
PARAMETERS VCUIL
*VCUIL = INFR.CUIL

N = " "
I = 1
DO WHILE  I< 15
   
   X = SUBSTR(VCUIL,I,1) 
   
   IF X$"0123456789"
     N = N + X
   ENDIF     
   I = I + 1
ENDDO   
   
   

RETURN N





*************************
FUNCTION DEVOLU
************************
SELECT LEGAJO,DESCUENTO  AS D FROM  32021 WHERE CONCEPTO = 654;
INTO CURSOR DESCU
SCAN
    SELECT NOMBRE,RETEN FROM INFOFIN WHERE LEGAJO = DESCU.LEGAJO;
    INTO CURSOR GAN
        
    VVIMPORTE = 0    
    VVIMPORTE = GAN.RETEN + DESCU.D
      
   * IF VVIMPORTE  > 0
   *     VVIMPORTE = GAN.RET - DESCU.D
   * ELSE
        *SET STEP ON ON
   *     IF VVIMPORTE < -1
   *          VVIMPORTE = GAN.RET + DESCU.D - (DESCU.D*2)  
   *     ELSE
   *         VVIMPORTE = DESCU.D -(DESCU.D * 2)  
   *    ENDIF
   * ENDIF
    UPDATE INFOFIN SET RETEN = VVIMPORTE WHERE LEGAJO = DESCU.LEGAJO
   
ENDSCAN
SELECT INFOFIN
*BROWSE FOR RET < 0





************************
FUNCTION COMPLETAR
**********************
SELECT RETMENSUAL
CAMPO = FIELD(2)
REPLACE ALL &CAMPO WITH 0
BROWSE
SELECT LEGAJO,DES FROM ABRIL INTO CURSOR LI
SCAN

    UPDATE RETMENSUAL SET &CAMPO = LI.DES WHERE LEGAJO = LI.LEGAJO
    SELECT RETMENSUAL


ENDSCAN

SELECT RETMENSUAL
CAMPO = FIELD(2)
REPLACE ALL &CAMPO WITH 0
BROWSE
SELECT LEGAJO,DES FROM ABRIL INTO CURSOR LI
SCAN

    UPDATE RETMENSUAL SET &CAMPO = LI.DES WHERE LEGAJO = LI.LEGAJO
    SELECT RETMENSUAL


ENDSCAN
