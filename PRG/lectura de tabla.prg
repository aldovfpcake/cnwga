SET EXCLUSIVE OFF
USE F:\FOXPRO2\TRANSPRV.DAT\PROVEED
BROWSE
gnFieldcount = AFIELDS(gaMyArray)  && Crea la matriz.
fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
FOR nCount = 1 TO gnFieldcount
? gaMyArray(nCount,1) + gaMyArray(nCount,2) && Muestra los nombres de los campos
linea = "["+gaMyArray(nCount,1)+"]" 
&&+ CHR(9) +gaMyArray(nCount,2)+ CHR(9) +STR(gaMyArray(nCount,3),30)
&&IIF(gaMyArray(nCount,2)="N","INT"," ")
dato = " "
DO CASE
   CASE gaMyArray(nCount,2) = "N"
         dato = "INT"
   CASE gaMyArray(nCount,2) = "C"      
         dato = "VARCHAR" + "(" + LTRIM(STR(gaMyArray(nCount,3),30))+")"
   CASE gaMyArray(nCount,2) = "M"
         dato = "VARCHAR [MAX]"
   CASE gaMyArray(nCount,2) = "D"           
         dato = "DATE"   
ENDCASE

&& + SPACE(10)+STR(gaMyArray(nCount,3),30,2)
linea = linea + CHR(9) + dato + "  NULL,"
tf.WriteLine(linea)

ENDFOR
tf.close
