
USE NLEGAJO
SET FILTER TO ID = 0
GO TOP
VVID = " "
DO WHILE .NOT. EOF()
     VVID =  STR(ANO,4)+ LTRIM(STR(LEGAJO,4))+ LTRIM(STR(CONCEPTO,4))+ STR(EMPRESA,1)
     ?VVID
     REPLACE ID WITH  VAL (VVID)
     SKIP
ENDDO
USE    
