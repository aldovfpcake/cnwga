
SET EXCLUSIVE OFF
SET DELETED ON
unidad= " "
unidad = "f:/"
 SET PATH TO &unidad\sueldos\empre1;&unidad\nwga\forms;&unidad\nwga\datos;&unidad\nwga\prg;c:\cnwga\forms
        ubiarch =  unidad+ "sueldos\empre1;&unidad\nwga\forms;" + unidad +" nwga\datos;" + unidad + "nwga\prg;c:\cnwga\forms;c:\cnwga\prg"
   
SELECT Personal.legajo, Personal.nombre, Nlegajo.octubre;
 FROM ;
     personal ;
     LEFT JOIN ganancias!nlegajo ;
   ON  Personal.legajo = Nlegajo.legajo;
 WHERE  Nlegajo.concepto = 300;
   AND  Nlegajo.octubre > 0;
   AND  personal.activo = "A";
   AND  Nlegajo.ano = 2016;
 ORDER BY Personal.legajo
