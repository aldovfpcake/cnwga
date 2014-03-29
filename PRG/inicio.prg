*SET DEFAULT TO E:\NWGA\DATOS
SET EXCLUSIVE OFF
SET DELETED ON
_screen.visible = .f.
LOCAL unidad
unidad = " "
unidad = ALLTRIM("c:")
*WAIT WINDOW SYS(2003) +" " + CURDIR()
SET SYSMENU TO
SET PATH TO  c:\cnwga\prg;c:\cnwga\forms
DO FORM logun
READ events
