
SELECT * FROM databaseconteiner.DBC ;

  WHERE OBJECTTYPE = 'Table' ;

  INTO CURSOR TABLAS







SELECT TABLAS

SCAN

  TABLA1 = TABLAS.OBJECTNAME

  USE &TABLA1 IN 0 EXCLUSIVE

  SELECT &TABLA1

  WAIT WINDOWS 'Tabla ' + ALLTRIM(TABLA1) + ' (' + TRANSFORM(RECNO('TABLAS')) + ;

    '/' + TRANSFORM(RECCOUNT('TABLAS')) + ')' NOWAIT

  FOR I=1 TO TAGCOUNT()

    IF !EMPTY(TAG(I))

      INDICE = SYS(14,I)

      NOMBRE = TAG(I)

      PRINCI = PRIMARY(I)

      IF PRINCI

        ALTER TABLE &TABLA1 DROP PRIMARY KEY

        ALTER TABLE &TABLA1 ADD PRIMARY KEY &INDICE TAG &NOMBRE

      ELSE

        INDEX ON &INDICE TAG &NOMBRE ADDITIVE

      ENDIF

    ELSE

      REINDEX

      EXIT

    ENDIF

    REINDEX

  ENDFOR

  PACK

ENDSCAN


 Versión imprimible  
Regenerar Indices de las Tablas de un DBC | Entrar/Crear una cuenta | 0 Comentarios
Mostrar Orden
Los comentarios son propiedad de sus respectivos autores.
No somos responsables de su contenido.

