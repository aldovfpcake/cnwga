SET deleted ON

USE C:\SUERUT\EMPRE1\SUE3
VarDedu = 0
SCAN
    VarDedu = 0
    
    UPDATE nlegajo SET diciembre = sue3.sneto;
    WHERE empresa = 1 .and.  ano =2016;
    .and. concepto = 5 .and. legajo = sue3.chapa
    
    IF sue3.sneto > 15000
       VarDedu = (203126.40 + 15000)
    ELSE   
       ? STR(sue3.chapa,4) +"Sac Menor 15000" 
       VarDedu = (203126.40+ sue3.sneto)
    ENDIF   
     
    UPDATE nlegajo SET diciembre = VarDedu;
    WHERE empresa = 1 .and.  ano =2016;
    .and. concepto = 300 .and. legajo = sue3.chapa 
     
    ?STR(sue3.chapa,4) + " " + STR(VarDedu,10,2)
       
    
ENDSCAN
