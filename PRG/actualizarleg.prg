SET EXCLUSIVE OFF
SET DELETED ON


DEFINE CLASS actualizarleg as Custom
Esposa        = 320
Hijo          = 330
Ctamedica     = 362 
Donaciones    = 363
Credithipo    = 360
ClcargaEsposa = 0 
EsposaImporte = 48447
CLegajo =0 
CLano = 2017
Clmes = FIELD(9)
Ccuil = "  "
     
  

     PROCEDURE INIT
       
     ENDPROC   


     



 	 PROCEDURE ActualizarEsposa
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Esposa;
           INTO CURSOR verifi
            ? STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)
            
           IF  verifi.julio = 0 .and. this.ClcargaEsposa <> 0
              WAIT WINDOW "Error Esposa No Cargada" + STR(this.CLegajo,4)    
              tf.WriteLine(linea)
            ENDIF    
             
            SELECT verifi
            USE    
               
      Endproc


     PROCEDURE ActualizarHijo
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Hijo;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+ this.Ccuil
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Error Hijo no Cargado" + STR(this.CLegajo,4)    
              tf.WriteLine(linea)
          ENDIF  
     
     
     Endproc  

     PROCEDURE ActCtamed
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Ctamedica;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Cta.Medica No Cargada" + STR(this.CLegajo,4)    
              tf.WriteLine(linea)
          ENDIF  
     Endproc


    PROCEDURE ActDonacio
          PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Donaciones;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Donaciones No Cargada" + STR(this.CLegajo,4)    
              tf.WriteLine(linea)
          ENDIF  

    ENDPROC
    
    PROCEDURE ActCreditoHipo
          PARAMETERS tf,importe
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.credithipo;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+ this.Ccuil
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Credito hipot No Cargado" + STR(this.CLegajo,4)    
              tf.WriteLine(linea)
          ENDIF  
          
          IF importe <> verifi.julio
             WAIT WINDOW "Credito Impotecario Difiere del Cargado" + STR(this.Clegajo,4)
             linea = "Credito Impotecario Difiere del Cargado" + STR(this.Clegajo,4)+" "+ this.Ccuil
             tf.WriteLine(linea)
          ENDIF   
          

    ENDPROC
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    PROCEDURE Destroy
      
             
    Endproc




ENDDEFINE





