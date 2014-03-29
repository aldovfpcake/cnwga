*mes = 2
*vcampo = FIELD( 5+mes,"gancias",1)
*WAIT WINDOW vcampo
* SELECT legajo,SUM(IIF(CONCEPTO = 500 ,&vcampo,0))AS &vcampo FROM nlegajo WHERE (select &vcampo  FROM nlegajo WHERE &campo<> 0 GROUP BY LEGAJO) 
*sum for concepto = 500  TO X
*sum julio for concepto = 510 TO z
*INSERT INTO c:\suerut\empre1\auditor (legajo,concepto,importe,mes,ano) values(382,130,x-z,7,2009)
 SET PATH TO C:\SUERUT\EMPRE1
 mes = "JUNIO"
 SELECT legajo,SUM(IIF(CLASE= 1 .OR. CLASE = 8,&MES,0))AS BASELQ,SUM(IIF(CONCEPTO = 500 ,&mes,0))as &mes ,SUM(IIF(CONCEPTO = 600 ,&mes,0)) as ret  FROM nlegajo;
  WHERE ano = 2012 .AND. EMPRESA = 1 GROUP BY legajo INTO CURSOR RETCUA
  SELECT R.LEGAJO,P.NOMBRE,R.BASELQ,R.RET FROM PERSONAL AS P  INNER JOIN RETCUA  AS R ON p.legajo = r.legajo ORDER BY r.legajo INTO CURSOR INFR READWRITE
  
  DO WHILE .NOT.EOF()
  
     IF INFR.RET <> 0
  
        INSERTAR()
      
      ENDIF
      SELECT INFR
      SKIP
  
  
  ENDDO  
 CLOSE TABLES
 RETURN
 
 
 
  FUNCTION INSERTAR
   TRY
         ATN = 0
        
         *SELECT LEGAJO,SUM(APORTE) + SUM(SINAPORTE) - SUM(DESCUENTO) AS NETO  FROM 52012  WHERE LIQUIDA = 3 .AND.   LEGAJO = INFR.LEGAJO ;
         GROUP BY LEGAJO INTO CURSOR sueldo
                    
         *IF INFR.RET > SUELDO.NETO
         *      ANT = 1
         *     MESSAGEBOX("Error Retención Mayor Al Sueldo" + STR(INFR.LEGAJO,4)+" " + INFR.NOMBRE + " " + STR(INFR.RET,7,2),16,"Atención")  
         *ENDIF          
            
              
             *IF ANT = 0
                INSERT INTO 62012 (LEGAJO,CONCEPTO,DESCRIP,DESCUENTO,LIQUIDA) VALUES(INFR.LEGAJO,130,"Imp.A las Gananc",INFR.RET,3)
           *  ENDIF
           *    INSERT INTO 22012 (LEGAJO,CONCEPTO,DESCRIP,DESCUENTO,LIQUIDA) VALUES(INFR.LEGAJO,130,"Imp.A las Gananc",INFR.RET,2)
            * ENDIF     
         
         *ENDIF 
            
   CATCH TO E
          WAIT WINDOW "ERROR En Descuento" + STR(R.LEGAJO,4)
   
   
   ENDTRY
 
   SELECT INFR
 
 
  RETURN .T.
 