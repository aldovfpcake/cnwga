* consulta para identificar los que ganen > 15000
* se va utilizar el campo logico ps de la estructura de personal
* quienen sean true estan sujetos a retención
* campo de la estrcutra de personal ps261

SELECT legajo,SUM(agosto)as bruto FROM nlegajo WHERE ano = 2013 .and. BETWEEN(CONCEPTO,1,40)  GROUP BY LEGAJO  INTO CURSOR CONSULTA

SCAN
  IF bruto > 15000
     UPDATE C:\SUERUT\EMPRE1\PERSONAL SET PS261 = .T. WHERE LEGAJO = CONSULTA.LEGAJO
  ENDIF
ENDSCAN

SELECT P.LEGAJO,P.NOMBRE,P.PS261,UNO.ag FROM C:\SUERUT\EMPRE1\PERSONAL AS P  INNER JOIN UNO ON UNO.legajo = P.LEGAJO WHERE P.ACTIVO = "A" ORDER BY AG;
INTO CURSOR REMU

REPORT FORM n:\cnwga\prg\infrm1242  TO PRINTER PROMPT