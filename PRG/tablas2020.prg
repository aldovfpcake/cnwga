SET EXCLUSIVE off
SET DELETED ON
SET ESCAPE ON
SET PATH TO F:\SUELDOS\EMPRE1
ON ERROR DO errhand WITH ;
ERROR( ), MESSAGE( ), MESSAGE(1), PROGRAM( ), LINENO( )

SET POINT TO ","
MiArchivoExcel = "c:\suerut\listados\tablaga.xlsx"
oExcel = CreateObject("Excel.Application")
oExcel.Workbooks.Open(MiArchivoExcel)
VarMes = 12
clear
for i=101 to 109

      *VarCell   = oExcel.Cells(i,4).value
      *Varporce  = oExcel.Cells(i,6).value
      *Varde     = oExcel.Cells(i,4).value
      *VarPort   = CAST(Varporce AS NUMERIC (4,2))
      *VarDesde  = CAST(Varde AS NUMERIC(10,2))
       VarPort   = CAST(oExcel.Cells(i,6).value AS NUMERIC (4,2))
       VarDe     = CAST(oExcel.Cells(i,3).value AS NUMERIC (12,2))
       VarA      = CAST(oExcel.Cells(i,4).value AS NUMERIC (10,2))
       VarSuma   = CAST(oExcel.Cells(i,5).value AS NUMERIC (10,2))
       VarExcede = CAST(oExcel.Cells(i,7).value AS NUMERIC (10,2))
        ?VarDe     
      
      
      SELECT mes,de,a,suma,porcentaje,excedente FROM nescala;
      WHERE mes = VarMes .and. porcentaje = VarPort INTO CURSOR existe
      ?_tally
      UPDATE NESCALA SET DE = VarDe,;
                         A  = VarA,;
                       SUMA = VarSuma,;
                  EXCEDENTE = VarExcede; 
                       WHERE MES=VarMes AND PORCENTAJE = VarPort   



next


PROCEDURE errhand
PARAMETER merror, mess, mess1, mprog, mlineno

IF merror = 2005
     x = TABLEREVERT( )
ENDIF

IF merror = 111 .or. merror = 1585 .or. merror = 3172
   SELECT curliq
   MESSAGEBOX("Revirtiendo Cambios Tabla de solo lectura",0,"Atención")
   x = TABLEREVERT()
ENDIF    

IF merror = 12
   RETURN
endif   




? 'Error número: ' + LTRIM(STR(merror))
? 'Mensaje de error: ' + mess
? 'Línea de código con error: ' + mess1
? 'Número de línea del error: ' + LTRIM(STR(mlineno))
? 'Programa con error: ' + mprog

