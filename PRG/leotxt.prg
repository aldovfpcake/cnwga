SET PATH TO f:\sueldos\empre1
SET TALK OFF
CLEAR
SET EXCLUSIVE OFF
USE importac AGAIN
scan
  PART1 =SUBSTR(CUIL,1,2)
  PART2 =SUBSTR(CUIL,11,1)
  PART3 = SUBSTR(CUIL,3,8)
  vcuil = PART1+ "-"+PART3+"-"+PART2
  buscarperso(vcuil) 
  replace importac.legajo WITH perso.legajo



endscan









FUNCTION buscarperso
PARAMETERS vcuil
SELECT legajo,nombre FROM personal WHERE cuil = vcuil;
into cursor perso


RETURN .t.






















