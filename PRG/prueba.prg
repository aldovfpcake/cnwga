PARAMETERS XXLEG,VEMPRESA
*XXLEG = 1
TRY
  INSERT INTO NLEGAJO(EMPRESA,LEGAJO,CONCEPTO,ano);
  SELECT CONCEPTO/CONCEPTO*VEMPRESA,LEGAJO(XXLEG),CONCEPTO,(concepto/concepto)*2012 FROM NCONCEPTOS
  WAIT WINDOW "ALTA EXITOSA" NOWAIT
CATCH TO oException
     MESSAGEBOX ("ERROR" + CHR(13) +STR(oException.ErrorNo,4),0,"AT")
    IF oException.ErrorNo = 1884
       MESSAGEBOX("YA EXISTEN REGISTROS PARA ESTE LEGAJO" + CHR(13) + "LEGAJO :" + STR(xxleg,5),0, "ERROR") 
      
    ENDIF
     FINALLY 

ENDTRY       
RETURN

FUNCTION LEGAJO()
PARAMETERS XXLEG
VVLEG = XXLEG 
RETURN vvleg

FUNCTION CLUV()
PARAMETERS VCLUV,,VEMPRESA

LOCAL vvcon
DO CASE 
   CASE CONCEPTO < 10
        vvcon = STR(concepto,1)
   CASE CONCEPTO < 99
        vvcon = STR(concepto,2)
   CASE CONCEPTO < 999
        vvcon = STR(concepto,3)
ENDCASE

VVID = "2010"+vvcon+ ALLTRIM(STR(legajo,4))+STR(vempresa,1)
RETURN VVID