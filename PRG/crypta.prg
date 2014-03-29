
FUNCTION encri()
    PARAMETERS txtaencrip
    SET CLASSLIB TO  "G:\nwga\datos\_crypt.vcx"
    LOCAL newstream,codg as String
    codg    = "sedona"
    x = CREATEOBJECT("_cryptapi") 
    x.EncryptSessionStreamString(txtaencrip,codg, @newstream)
  *  WAIT  WINDOW newstream
RETURN newstream



FUNCTION Desencrip()
   PARAMETERS txtencrip
   SET CLASSLIB TO  "G:\nwga\datos\_crypt.vcx"
   LOCAL newstream,codg as String
   codg    = "sedona"
   x = CREATEOBJECT("_cryptapi")  
   x.DecryptSessionStreamString(txtencrip,codg, @newstream) 
  * WAIT WINDOW newstream
RETURN newstream   










DEFINE CLASS encri AS _cryptapi
  
  
   
  
	stream = " "
	newstream = " "
	dstrwing = " "
	
     
   	
    PROCEDURE init
        
    
    ENDPROC

    PROCEDURE ENCRI
	     DODEFAULT(DecryptSessionStreamString WITH (this.dstrwing, this.codg,this.@stream))
	     *dodefaultDecryptSessionStreamString(this.dstrwing, this.codg,this.@stream)
    	WAIT WINDOW stream
    ENDPROC 

    PROCEDURE DESENCRI
	    this.DecryptSessionStreamString(stream, codg, @newstream)
	    WAIT WINDOW  this.newstream
    ENDPROC   
 
 ENDDEFINE
 
 
 
 