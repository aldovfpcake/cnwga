SET EXCLUSIVE off
SET DELETED ON
SET ESCAPE ON
ON ERROR DO errhand WITH ;
ERROR( ), MESSAGE( ), MESSAGE(1), PROGRAM( ), LINENO( )

MiArchivoExcel = "C:\NWGA\EXCEL\art94.xlsx"
*MiArchivoExcel = GETFILE()
oExcel = CreateObject("Excel.Application")
oExcel.Workbooks.Open(MiArchivoExcel)
oExcel.sheets(1).Select
oExcel.Workbooks.Open(miExcel)
oExcel.Sheets(1).Select
clear
Varmes = 12
FOR i =154 TO 162
     
     Varde    = oExcel.Cells(i,2).value
     Vara     = oExcel.Cells(i,3).value
     VarSuma  = oExcel.Cells(i,4).value
     VarPorce = oExcel.Cells(i,5).value
     VarExced = oExcel.Cells(i,6).value
     ?Varde  
     ?VarExced
     UPDATE Nescala SET de         = Varde,;
                        a          = Vara,;
                        suma       = VarSuma,;
                        porcentaje = VarPorce,;
                        excedente  = VarExced;
                        WHERE MES = Varmes .and. Porcentaje = VarPorce

NEXT



oExcel.quit()









PROCEDURE errhand
PARAMETER merror, mess, mess1, mprog, mlineno

IF merror = 2005
     x = TABLEREVERT( )
ENDIF

IF merror = 111 .or. merror = 1585 .or. merror = 3172
   SELECT curliq
   MESSAGEBOX("Revirtiendo Cambios Tabla de solo lectura",0,"Atenci?n")
   x = TABLEREVERT()
ENDIF    

IF merror = 12
   RETURN
endif   




? 'Error n?mero: ' + LTRIM(STR(merror))
? 'Mensaje de error: ' + mess
? 'L?nea de c?digo con error: ' + mess1
? 'N?mero de l?nea del error: ' + LTRIM(STR(mlineno))
? 'Programa con error: ' + mprog






