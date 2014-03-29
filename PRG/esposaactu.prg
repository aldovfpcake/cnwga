SELECT * FROM nlegajo WHERE concepto =320 .and. ano = 2013 .and. empresa = 1;
INTO CURSOR TABLA
SELECT TABLA
GO TOP
DO WHILE .NOT. EOF()

   UPDATE NLEGAJO SET MARZO     = 17280/12*3 
                      ABRIL     = 17280/12*4;
                      MAYO      = 17280/12*5,;
                      JUNIO     = 17280/12*6,;
                      JULIO     = 17280/12*7,;
                      AGOSTO    = 17280/12*8,;
                      SETIEMBRE = 17280/12*9,;
                      OCTUBRE   = 17280/12*10,;
                      NOVIEMBRE = 17280/12*11,;
                      DICIEMBRE = 17280/12*12;
                      WHERE NLEGAJO.LEGAJO = TABLA.LEGAJO .AND. CONCEPTO = 320 .AND. ANO = 2013 .AND. EMPRESA = 1 .AND. LEGAJO = 648

  SELECT TABLA
  SKIP

ENDDO

CLOSE TABLES ALL
RETURN