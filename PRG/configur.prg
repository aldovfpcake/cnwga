*PARAMETERS vvempresa,vvprocesos
vvempresa = 1
vvprocesos = 1
*LOCAL vvempresa
*SET STEP ON 
*vvempresa = 1
LOCAL unidad,ubiarch as Character 
 

unidad= " "
unidad = "f:\"

DO case
   CASE vvempresa = 1
        SET PATH TO &unidad\sueldos\empre1;&unidad\nwga\forms;&unidad\nwga\datos;&unidad\nwga\prg;c:\cnwga\forms;c:\fwsu\prg
        ubiarch =  unidad+ "sueldos\empre1;&unidad\nwga\forms;" + unidad +" nwga\datos;" + unidad + "nwga\prg;c:\cnwga\forms;c:\cnwga\prg"
    CASE vvempresa = 2
        SET PATH TO &unidad\sueldos\empre2;&unidad\nwga\forms;&unidad\nwga\datos;&unidad\nwga\prg;c:\cnwga\forms
        ubiarch =   unidad+ "sueldos\empre2;&unidad\nwga\forms;" + unidad +" nwga\datos;" + unidad + "nwga\prg;c:\cnwga\forms;c:\cnwga\prg"
     CASE vvempresa = 3
        SET PATH TO &unidad\sueldos\empresa-3;&unidad\nwga\forms;&unidad\nwga\datos;&unidad\nwga\prg;c:\cnwga\forms
        ubiarch =   unidad+ "sueldos\empresa-3;&unidad\nwga\forms;" + unidad +" nwga\datos;" + unidad + "nwga\prg;c:\cnwga\forms;c:\cnwga\prg"




ENDCASE
TRY
	SET TALK OFF
	SET EXCLUSIVE off
	SET REPROCESS TO AUTOMATIC
	OPEN DATABASE f:\sueldos\nwga\datos\ganancias SHARED VALIDATE
	SET PROCEDURE TO c:\cnwga\prg\clasfg
CATCH TO E 
    WAIT WINDOW "No se Puede Abrir la base de datos"
    CLEAR EVENTS
    QUIT
ENDTRY   


SELECT LEGAJO,NOMBRE,PS261,NIVELGCIA,CUIL FROM PERSONAL WHERE ACTIVO = "A";
ORDER BY NOMBRE INTO CURSOR LPERSONAL
SELECT personal
use
vvlogin = 1
USE gancias NODATA
DO case
   CASE vvprocesos = 1 
         DO FORM pp WITH vvempresa,vvlogin,ubiarch
   CASE vvprocesos = 2 
        DO FORM pp WITH vvempresa,vvlogin,ubiarch
      
   CASE vvprocesos = 3  
        DO FORM pp WITH vvempresa,vvlogin,ubiarch
   
   CASE vvprocesos = 4
        USE vistaperso
        DO FORM legfm     
        

   CASE vvprocesos = 5
        *DO C:\fwsu\PRG\lista
        
        SET PROCEDURE TO C:\FWSU\prg\CLASSLIQ
        SET EXCLUSIVE OFF
        SET DELETED ON
        CLOSE TABLES all
       *SET PATH TO c:\suerut\empre1
        x=CREATEOBJECT('configurar')
        x.Seteopat(1)
        DO FORM listafm WITH 1
        
   CASE vvprocesos = 7
        DO C:\fwsu\PRG\liquidacion
    


   CASE vvprocesos = 10
        DO FORM fdeducciones
   
   CASE vvprocesos = 11
        DO FORM formescala  
   
   CASE vvprocesos = 12   
        DO C:\fwsu\PRG\lista2
              
        
ENDCASE 
*� 2018 GitHub, Inc.