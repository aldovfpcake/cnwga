*PARAMETERS vvempresa,vvprocesos
*vvempresa =  1 
vvprocesos = 1
*LOCAL vvempresa
*SET STEP ON 
vvempresa = 1
LOCAL unidad,ubiarch as Character 
 
unidad= " "
unidad = "C:\"

SET PATH TO C:\NWGA\FORMS;C:\NWGA\DATOS;C:\NWGA\PRG;C:\CNWGA\FORMS;C:\SUERUT\EMPRE1
TRY
	SET TALK OFF
	SET EXCLUSIVE off
	SET REPROCESS TO AUTOMATIC
	SET DELETED ON
	OPEN DATABASE C:\nwga\datos\ganancias SHARED 
	*OPEN DATABASE f:\sueldos\nwga\datos\ganancias SHARED VALIDATE
	SET PROCEDURE TO c:\cnwga\prg\clasfg
CATCH TO E 
    WAIT WINDOW "No se Puede Abrir la base de datos"
    CLEAR EVENTS
    QUIT
ENDTRY   


SELECT LEGAJO,NOMBRE,PS261,NIVELGCIA,CUIL FROM C:\SUERUT\EMPRE1\PERSONAL WHERE ACTIVO = "A";
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
        DO FORM calcugral
   
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
*© 2018 GitHub, Inc.