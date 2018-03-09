             SELECT  Nconceptos.concepto,nlegajo.diciembre;
			 FROM ;
     		 ganancias!nlegajo ;
    		 INNER JOIN ganancias!nconceptos ;
   			 ON  Nlegajo.concepto = Nconceptos.concepto;
 			 WHERE  Nlegajo.legajo = 1;
   			 AND  Nlegajo.empresa = 1;
   			 AND  Nlegajo.ano = 2018;
             AND  Nconceptos.clase=2;