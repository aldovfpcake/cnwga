CLOSE TABLES ALL
SET TALK OFF
SET DELETED ON
SET TEXTMERGE ON  
SET EXCLUSIVE OFF
USE reintegro2 ALIAS re 
SET FILTER TO Desc <> 0
SELECT 0
USE F:\SUELDOS\EMPRE1\102015 ALIAS LIQ
*STORE FCREATE('c:\suerut\consultas\names.txt') TO _TEXT   
SELECT RE
GO TOP
  
SCAN
    SELECT LEGAJO,CONCEPTO,LIQUIDA FROM LIQ WHERE CONCEPTO = 175 .AND. LIQUIDA = 3 .AND.;
    LEGAJO = RE.LEGAJO INTO CURSOR EXISTE
    ?RE.LEGAJO    
    IF RECCOUNT() =0
         *TEXT        
          INSERT INTO LIQ (LEGAJO,CONCEPTO,DESCRIP,LIQUIDA,SINAPORTE ) VALUES( re.legajo,175,"Reit.Gan.Cta 5 ", 3,(re.desc/5))
         ?"Insertando----->"+ str(RE.LEGAJO,4)
        * ENDTEXT
    
    ENDIF
    SELECT RE   
     
ENDSCAN 

CLOSE ALL  && Close the text file and the table
*MODIFY FILE c:\suerut\consultas\names.txt