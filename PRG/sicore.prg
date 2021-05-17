fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\sueldos\testfile.txt', .t.)
LOCAL codigComp,fecha,numercomp,importecomp,Varcuil

numercomp = " "
imporetcomp = " "
fecha="28/04/2021"
scan
 IF reten > 0
    CodigComp = "07"
 ELSE   
   CodigComp = "08"
   local importe as number
   importe = 0
   importe = abs(reten)
   replace reten with importe
   replace haber WITH reten
endif
  numerocomp = StrZero(legajo,16)
*               
  imporetcomp = StrZero(haber,16) 
  Varcuil = lTRIM(pasocuil(cuil))

  linea = CodigComp+fecha+numerocomp+PADL(haber,16,"0")+"0787"+"160"+"1"+PADL(haber,14,"0")+fecha+"01"+"0"+PADL(reten,14,"0")+PADL(0,6,"0")+fecha+"86"+PADL(Varcuil,20,"0")+PADL(0,14,"0")

  tf.WriteLine(linea) 
endscan


tf.Close
return
Function StrZero( iNum, iZeros )
return PadL(iNum, iZeros,"0")


******************
function pasocuil
*****************
parameters vcuil
*vcuil = infr.cuil

n = " "
i = 1
do while  i< 15
   
   x = substr(vcuil,i,1) 
   
   if x$"0123456789"
     n = n + x
   endif     
   i = i + 1
enddo   
   
   

return n
