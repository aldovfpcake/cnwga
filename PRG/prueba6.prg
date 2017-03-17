SET DELETED ON
SET SAFETY OFF
SET EXCLUSIVE OFF
SET PATH TO  C:\CNWGA\FORMS;F:\SUELDOS\EMPRE1
SET DEVICE TO FILE C:\SUERUT\LISTADOS\GNA.TXT
CLEAR

SELECT SUM(DESCUENTO)as des ,LEGAJO FROM 22017 WHERE CONCEPTO = 130  GROUP BY LEGAJO  INTO CURSOR RET ;

vtotal = 0

SCAN 
    
      
       actualizar()
       vtotal = vtotal + ret.des
       SELECT ret
ENDSCAN

?"Total Retenido x Vac..............:"+ STR(vtotal,10,2)







FUNCTION ACTUALIZAR()
    SELECT FEBRERO FROM nlegajo WHERE empresa = 1 .and. ano = 2017 .and. legajo = ret.legajo .and. concepto = 500;
    INTO CURSOR VER
    IF ver.FEBRERO <> ret.des
       @ROW()+1,1 SAY "Actualizando :" + STR(ret.legajo,4)
       UPDATE NLEGAJO SET FEBRERO = ret.des;
       WHERE EMPRESA =1 .AND. ANO = 2017 .AND. LEGAJO = ret.legajo .and. concepto =500
       UPDATE NLEGAJO SET FEBRERO = ret.des;
       WHERE EMPRESA =1 .AND. ANO = 2017 .AND. LEGAJO = ret.legajo .and. concepto =600
       
    ENDIF   
     
     


RETURN .T.







