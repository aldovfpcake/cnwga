SET PATH TO c:\suerut\empre1
SET TALK OFF
CLEAR
SET DELETED ON
SET EXCLUSIVE OFF
USE importac AGAIN
GO top
clear
scan
  PART1 =SUBSTR(CUIL,1,2)
  PART2 =SUBSTR(CUIL,11,1)
  PART3 = SUBSTR(CUIL,3,8)
  vcuil = PART1+ "-"+PART3+"-"+PART2
  ?vcuil
  buscarperso(vcuil) 
   


endscan
BROWSE
return








FUNCTION buscarperso
PARAMETERS vcuil
SELECT legajo,nombre FROM personal WHERE cuil = vcuil .and. activo = "A";
into cursor perso
IF EOF()
   WAIT WINDOW "ERROR NO SE ENCUENTRA " + vcuil
ENDIF
?perso.legajo
 replace importac.legajo WITH perso.legajo


RETURN .t.






















