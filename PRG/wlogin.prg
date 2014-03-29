#DEFINE GOODPASSWORD_LOC	"Good Password provided"
#DEFINE BADPASSWORD_LOC		"Bad Password provided"
#DEFINE GETPASSWORD_LOC		"Enter First Name as password."
SET EXCLUSIVE OFF





LOCAL loForm,loCustom
loForm = createobject("_login")
IF VARTYPE(loForm) # "O"
	RETURN
ENDIF

loCustom = Create("custom")
loForm.oPassword = loCustom
loForm.cDBFName = "g:\nwga\datos\netsu.dbf"
loForm.cTable = "netsu"
loForm.cFieldName = "nombre"
loForm.cPassword = "pasword"
loForm.Setup()
loform.caption = "Ingreso Al Sistema de Retenciones 4ta c"
loForm.Show(1)

UPDATE netsu;
       SET nombre  = encri(nombre),;
           pasword = encri(pasword)
       *from netsu
       
USE
IF Locustom.lValidPassword = .t.
    DO formtree 
ENDIF   
