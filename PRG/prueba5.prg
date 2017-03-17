ParmLegajo =1
ParmEmpresa = 1
ParmAno = 2016
clear
SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 FROM ;
     ganancias!nlegajo ;
    INNER JOIN ganancias!nconceptos ;
   ON  Nlegajo.concepto = Nconceptos.concepto;
 WHERE  Nlegajo.legajo = ?ParmLegajo;
   AND  Nlegajo.empresa = ?ParmEmpresa;
   AND  Nlegajo.ano = ?ParmAno;
   AND  Nconceptos.concepto = 145
