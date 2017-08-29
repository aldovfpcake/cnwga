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
Cnombre = " "     
Cgastosmedicos = 3656  

     PROCEDURE INIT
       
     ENDPROC   


     



 	 PROCEDURE ActualizarEsposa
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Esposa;
           INTO CURSOR verifi
            
            linea = STR(this.Clegajo,4)+" " +importac.cuil + " "+importac.nombre+ " " + STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)
                        
            
            IF  verifi.julio = 0 .and. this.ClcargaEsposa <> 0
              WAIT WINDOW "Error Esposa No Cargada" + STR(this.CLegajo,4) + " "+ importac.nombre     
              tf.WriteLine(linea)
            ENDIF    
             
            SELECT verifi
            USE    
            SELECT importac
            return   
      Endproc


     PROCEDURE ActualizarHijo
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Hijo;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+ this.Ccuil+ " "+ this.Cnombre
            
           tf.WriteLine(linea)
            canth = 0
            canth = importac.hijos *14.252
            IF verifi.julio <> canth
               ? "Error  Modificando" + STR(this.CLegajo,4)
            
            ENDIF

           
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Error Hijo no Cargado" + STR(this.CLegajo,4)    
              linea = linea + "alta"
              tf.WriteLine(linea)
          ENDIF  
          return
     
     Endproc  

     PROCEDURE ActCtamed
           PARAMETERS tf
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.Ctamedica;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+this.Ccuil + " " + this.cnombre
           ?linea
           tf.WriteLine(linea)
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
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+this.Ccuil + " " + this.cnombre
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Gastos medicos  No Cargados" + STR(this.CLegajo,4) 
              linea = linea + "alta"   
              tf.WriteLine(linea)
          ENDIF  

    ENDPROC
    
    PROCEDURE ActCreditoHipo
          PARAMETERS tf,importe
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.credithipo;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+ this.Ccuil + " " + this.cnombre
           ?linea
           IF  verifi.julio = 0 
              WAIT WINDOW "Credito hipot No Cargado" + STR(this.CLegajo,4)    
              linea = linea + "alta"
              tf.WriteLine(linea)
          ENDIF  
          
          IF importe <> verifi.julio
             WAIT WINDOW "Credito Impotecario Difiere del Cargado" + STR(this.Clegajo,4)
             linea = linea + "Credito Impotecario Difiere del Cargado" 
             tf.WriteLine(linea)
          ENDIF   
          

    ENDPROC
    
    PROCEDURE Actgastosmedicos
          PARAMETERS tf,importe
           SELECT concepto, julio FROM nlegajo WHERE legajo = this.Clegajo;
           AND empresa = 1 AND ano = this.Clano AND Concepto =this.cgastosmedicos;
           INTO CURSOR verifi
            linea = STR(this.Clegajo,4)+" "+ STR(verifi.concepto,4)+ " "+ STR(verifi.julio,10,2)+ " "+ this.Ccuil + " " + this.cnombre
           ?linea
           IF  verifi.julio = 0 
              *WAIT WINDOW "Gastos medicos no cargados" + STR(this.CLegajo,4)    
              linea = linea + "alta" + " " + STR(importac.gastosmed,12,2)
              tf.WriteLine(linea)
          ENDIF  
          
          
    ENDPROC
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    PROCEDURE Destroy
      
             
    Endproc




ENDDEFINE





