Local loForm
 
  loForm = CreateObject("MIFORM")
  
  loForm.Show()
  MODIFY FORM loForm
  READ EVENTS
 
  loForm = .NULL.
 
  Release loForm
 
Return
*
*
DEFINE CLASS MIFORM AS FORM
 
  PROCEDURE DESTROY
    CLEAR EVENTS
  ENDPROC
 
ENDDEFINE