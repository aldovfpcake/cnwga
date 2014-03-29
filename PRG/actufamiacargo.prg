SELECT legajo,unidades FROM nlegajo WHERE ano = 2013 .and. concepto = 350 .and. unidades <>0;
INTO CURSOR acargo
GO top
SCAN
     UPDATE nlegajo SET unidades = acargo.unidades;
            WHERE nlegajo.legajo = acargo.legajo .AND. nlegajo.ano = 2014
     SELECT acargo        


ENDSCAN

