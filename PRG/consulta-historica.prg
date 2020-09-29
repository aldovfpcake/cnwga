Varlegajo   = 246
Varano      = 2018
Varempresa  = 1
PUBLIC vvnombre
vvnombre = "CRISPI SANDRA MARIA"

SELECT Nlegajo.legajo, Nconceptos.clase, Nlegajo.concepto,;
  Nconceptos.descripcio, Nlegajo.enero, Nlegajo.febrero, Nlegajo.marzo,;
  Nlegajo.abril, Nlegajo.mayo, Nlegajo.junio, Nlegajo.julio, Nlegajo.agosto,;
  Nlegajo.setiembre, Nlegajo.octubre, Nlegajo.noviembre, Nlegajo.diciembre;
 FROM ;
     ganancias!nlegajo ;
    INNER JOIN ganancias!nconceptos;
   ON  Nlegajo.concepto = Nconceptos.concepto;
 WHERE  Nlegajo.legajo = Varlegajo;
   AND  Nlegajo.ano = Varano;
   AND  Nlegajo.empresa = Varempresa;
 ORDER BY Nlegajo.concepto INTO CURSOR gancias
