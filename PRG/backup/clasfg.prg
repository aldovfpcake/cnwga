DEFINE CLASS ofamilia as Custom

		ocanthijos = 0
		oesposa    = 0
		olegajo    = 0
		oempresa   = 0


    	PROCEDURE busco
            SET DATE ITALIAN
            SET CENTURY ON
            
            IF this.oempresa = 1 
            	SELECT legajo,nombre,parent,fnac,this.calcuant(DATE(),fnac)as edad  FROM c:\suerut\empre1\asigfa WHERE legajo = this.olegajo;
            	INTO CURSOR familia
            ENDIF
            
            IF this.oempresa = 2
               SELECT * FROM C:\SUERUT\EMRRE2\ASIGFA WHERE LEGAJO = this.olegajo; 
               INTO CURSOR FAMILIA  
            ENDIF 
            
        		              
        this.cierro
        this.cuentohijos    
    	
    	endproc      

        PROCEDURE cierro
          SELECT asigfa
          use
          
        
        endproc    

       PROTECT PROCEDURE cuentohijos
           SELECT COUNT(FAMILIA.LEGAJO) AS CT FROM FAMILIA WHERE FAMILIA.PARENT = "HIJO/A" ;
           INTO CURSOR CTJ
           
           SELECT CTJ
           IF .NOT. EOF()
               this.ocanthijos = ct
           ENDIF
           SELECT CTJ
           USE    
        
        endproc  
               
    	     *****************
		 function calcuant
		*****************


		parameters factual,fcalcula
		* valor de retorno es antg
		store 0 to antg,resto

		if empty(fcalcula)
    			antg = 0
    			return antg
		endif    


		private aoactual,aocalc,maactual,mealcl
		store 0 to aoactual,aocalc,maactual,mcalcu

		maactual = val(substr(dtoc(factual),4,2))
		mcalcu   = val(substr(dtoc(fcalcula),4,2))
		aoactual = val(substr(dtoc(factual),7,4))
		aocalc   = val(substr(dtoc(fcalcula),7,4))


		mcalcu   = month(fcalcula)
		maactual = month(factual)
		if year(factual) > year(fcalcula)
      
   		if month(factual) > month(fcalcula)  
      			antg =  year(factual) - year(fcalcula)
   		else
      		antg = (year(factual) - year(fcalcula)) -1
   		endif
    	if month(factual) = month(fcalcula) 
       		antg =  year(factual) - year(fcalcula) 
    	endif   

		else    
    		antg = 0
		endif    
        return antg

















ENDDEFINE


DEFINE CLASS CALCULORET as custom
       mes      = 0
       sjtoaret = 0

       


       PROCEDURE CALCURET   
       MESANTERIOR = "  " 
       DO  CASE  
              CASE this.mes = 1
                    NOMBREMES   = "ENERO" 
                    MESANTERIOR = "  " 
                    this.calcret(nombremes,mesanterior)
                                                              
               CASE this.mes = 2
                    NOMBREMES   = "FEBRERO" 
                    MESANTERIOR = "ENERO"
                    this.calcret(nombremes,mesanterior) 
                   
                                                              
               CASE this.mes = 3
                     NOMBREMES = "MARZO" 
                     MESANTERIOR = "FEBRERO"
                     this.calcret(nombremes,mesanterior)
                      
              CASE this.mes = 4
                     NOMBREMES = "ABRIL" 
                     MESANTERIOR = "MARZO"
                     this.calcret(nombremes,mesanterior)
                   
                                                              
              CASE this.mes = 5
                     NOMBREMES = "MAYO" 
                     MESANTERIOR = "ABRIL"
                     this.calcret(nombremes,mesanterior) 
                       
              CASE this.mes = 6
                    NOMBREMES = "JUNIO" 
                    MESANTERIOR = "MAYO"
                    this.calcret(nombremes,mesanterior)    
           	  CASE this.mes = 7
                    NOMBREMES = "JULIO"
                    MESANTERIOR = "JUNIO"
                    this.calcret(nombremes,mesanterior)   
          
                 
         	  CASE this.mes = 8
                    NOMBREMES = "AGOSTO"
                    MESANTERIOR = "JULIO"
                    this.calcret(nombremes,mesanterior)  
        
          	  CASE this.mes = 9
                    NOMBREMES = "SETIEMBRE"
                    MESANTERIOR = "AGOSTO"
                    this.calcret(nombremes,mesanterior)  
        
          CASE this.mes = 10
                    NOMBREMES = "OCTUBRE"
                    MESANTERIOR = "SETIEMBRE"
                    this.calcret(nombremes,mesanterior)  
         
          CASE this.mes = 11
                    NOMBREMES = "NOVIEMBRE"
                    MESANTERIOR = "OCTUBRE"
                    this.calcret(nombremes,mesanterior)
          
          CASE this.mes = 12
                    NOMBREMES = "DICIEMBRE"
                    MESANTERIOR = "NOVIEMBRE"
                    this.calcret(nombremes,mesanterior)
                    
        
        
        ENDCASE   
        *SELECT CALCULA
        *USE 
       
        ENDPROC
        
        
        PROCEDURE CALCRET      
        PARAMETERS NOMBREMES,MESANTERIOR
        TRY 
                   SELECT SUM(&NOMBREMES)AS TREMU FROM GANCIAS WHERE CLASE = 1;    
                   INTO CURSOR CALCULA
                   UPDATE GANCIAS SET &NOMBREMES = CALCULA.TREMU*11/100; 
                   WHERE CONCEPTO = 100                           
                   UPDATE GANCIAS SET &NOMBREMES = CALCULA.TREMU*3/100; 
                   WHERE CONCEPTO = 120                           
                   UPDATE GANCIAS SET &NOMBREMES = CALCULA.TREMU*3/100; 
                   WHERE CONCEPTO = 130    
                   IF NOMBREMES <> "ENERO"
                      SELECT SUM(&MESANTERIOR) AS RETAC FROM GANCIAS WHERE CLASE = 2;
                      INTO CURSOR RET           
                      UPDATE GANCIAS SET &NOMBREMES = RET.RETAC; 
                      WHERE CONCEPTO = 180 
                      SELECT RET  
                      USE
                   ENDIF 
        
          CATCH TO ERR
                 WAIT WINDOW "ERROR " + STR(ERROR(),4) 
                 FINALLY  
                
         ENDTRY
                
        SELECT CALCULA
        USE
        
        
        ENDPROC
        
        
        
        
        
        
        
        
        
        
        
        
        PROCEDURE DEDUPER
           
          SELECT IMPORTE AS GNIP   FROM DEDUGR WHERE CONCEPTO = 310;
          INTO CURSOR GANOIP
          SELECT  IMPORTE AS DEDUI FROM DEDUGR WHERE CONCEPTO =  300;
          INTO CURSOR DEDUES 
          
          SELECT GANCIAS
          
          P = 1
          FOR I = 5 TO 16
             IF I = 5          
                 REPLACE (FIELD(I)) WITH (GANOIP.GNIP/12) FOR CONCEPTO = 310 
                 REPLACE (FIELD(I)) WITH (DEDUES.DEDUI/12) FOR CONCEPTO = 300  
              ELSE
                 REPLACE (FIELD(I)) WITH (GANOIP.GNIP/12)*P FOR CONCEPTO = 310
                 REPLACE (FIELD(I)) WITH (DEDUES.DEDUI/12)*P FOR CONCEPTO = 300
              ENDIF 
              P = P + 1 
          NEXT      
        
        
        
        
        
           SELECT GANOIP
           USE
           SELECT DEDUES
           USE
        
        ENDPROC
          

        PROCEDURE CALCUGNETA
             STORE 0 TO vvbr,vvdesc,vvdedui,vvganacu
             SELECT gancias
            DO CASE
               CASE this.mes = 1
                        nomes  = "ENERO"
                        nomante = "    "  
                        this.clcgn(nomes,nomante)    
                CASE this.mes = 2  
                        nomes   = "FEBRERO"
                        nomante = "ENERO"
                        this.clcgn(nomes,nomante) 
                                            
                        
                                 
                 CASE this.mes = 3  
                        nomes   = "MARZO"
                        nomante = "FEBRERO"
                        this.clcgn(nomes,nomante) 
                        
                 CASE this.mes = 4  
                        nomes   = "ABRIL"
                        nomante = "MARZO"
                        this.clcgn(nomes,nomante) 
                         
                                                 
                CASE this.mes = 5  
                         nomes   = "MAYO "
                         nomante = "ABRIL"
                         this.clcgn(nomes,nomante) 
                                              
                                  
              	CASE this.mes = 6  
                         nomes = "JUNIO "
                         nomante = "MAYO"
                         this.clcgn(nomes,nomante) 
                        
            	CASE this.mes = 7  
                          nomes = "JULIO "
                          nomante = "JUNIO"
                          this.clcgn(nomes,nomante) 
                        
            	CASE this.mes = 8     
                          nomes = "AGOSTO"
                          nomante = "JULIO"
                          this.clcgn(nomes,nomante)   
            	CASE this.mes = 9     
                          nomes = "SETIEMBRE"
                          nomante = "AGOSTO"
                          this.clcgn(nomes,nomante)             
               
            	CASE this.mes = 10      
               
                          nomes = "OCTUBRE"
                          nomante = "SETIEMBRE"
                          this.clcgn(nomes,nomante)             
               
           CASE this.mes = 11    
                          nomes = "NOVIEMBRE"
                          nomante = "OCTUBRE"
                          this.clcgn(nomes,nomante)             
               
           CASE this.mes = 12                  
                           
                          nomes = "DICIEMBRE"
                          nomante = "NOVIEMBRE"
                          this.clcgn(nomes,nomante)             
                  
               
               
            ENDCASE        
        
        ENDPROC
        
        PROCEDURE CLCGN
        Parameters nomes,nomante
        STORE 0 TO vvbr,vvdesc,vvdedui,vvganacu
                        SELECT gancias
                        SUM &nomes  TO vbr FOR clase = 1 .or. clase = 8
				    	SUM &nomes  TO vvdesc FOR clase = 2
						SUM &nomes  TO vvdedui FOR clase = 3
						UPDATE GANCIAS SET &nomes =  (vbr- vvdesc); 
						WHERE CONCEPTO = 200 
                        IF nomes <> "ENERO"    						
						   SUM &nomante  TO vvganacu FOR concepto = 200 .or. concepto = 210 
						   UPDATE GANCIAS SET  &nomes = vvganacu ;
						   WHERE CONCEPTO = 210
					   	   this.sjtoaret = ((vbr- vvdesc)-vvdedui)+ vvganacu 
                           UPDATE GANCIAS SET &nomes = this.sjtoaret ; 
						   WHERE CONCEPTO = 400        
                       ELSE
                           this.sjtoaret = (vbr- vvdesc)-vvdedui 
                           UPDATE GANCIAS SET &nomes = this.sjtoaret ; 
						   WHERE CONCEPTO = 400 
                       ENDIF
        
        
        ENDPROC
        
         
        
        
        
        
        
        
        
        
        
        PROCEDURE CALCURETEN
            RNOMBREMS = " "
            RMESANTE  = " "
            retencion = 0
            retean = 0          
            SELECT * FROM NESCALA WHERE MES = THIS.MES INTO CURSOR ESCALA
            SELECT escala
            
            DO WHILE .not. EOF()  
                IF escala.de < this.sjtoaret 
                   IF escala.a > this.sjtoaret
                      WAIT WINDOW STR(ESCALA.PORCENTAJE,2) 
                      exit
                   ENDIF
                ENDIF   
                SKIP
            
            ENDDO
            
            retencion = ((this.sjtoaret - escala.excedente)*escala.porcentaje/100) + escala.suma 
            
            DO CASE
               CASE THIS.MES = 1
                	     UPDATE GANCIAS SET ENERO = retencion ; 
						 WHERE CONCEPTO = 500  
               CASE THIS.MES = 2
                	     SELECT gancias
                	     SUM ENERO   TO retean FOR concepto =500
                	     UPDATE GANCIAS SET FEBRERO = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET FEBRERO = retean ; 
						 WHERE CONCEPTO = 510  
               
               CASE THIS.MES = 3
                	     SELECT gancias
                	     SUM FEBRERO   TO retean FOR concepto =500
                	     UPDATE GANCIAS SET MARZO = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET MARZO = retean ; 
						 WHERE CONCEPTO = 510  
                
                CASE THIS.MES = 4
                	     SELECT gancias
                	     SUM  MARZO   TO retean FOR concepto =500
                	     UPDATE GANCIAS SET ABRIL = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET ABRIL = retean ; 
						 WHERE CONCEPTO = 510  
                CASE THIS.MES = 5
                	     SELECT gancias
                	     SUM  ABRIL   TO retean FOR concepto =500
                	     UPDATE GANCIAS SET MAYO = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET MAYO = retean ; 
						 WHERE CONCEPTO = 510  
                 CASE THIS.MES = 6
                	     SELECT gancias
                	     SUM  MAYO   TO retean FOR concepto =500
                	     UPDATE GANCIAS SET JUNIO = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET JUNIO = retean ; 
						 WHERE CONCEPTO = 510  
                
                 CASE THIS.MES = 7
                	     SELECT gancias
                	     SUM  JUNIO  TO retean FOR concepto =500
                	     UPDATE GANCIAS SET JULIO = retencion ; 
						 WHERE CONCEPTO = 500  
                         UPDATE GANCIAS SET JULIO = retean ; 
						 WHERE CONCEPTO = 510  
                 CASE THIS.MES = 8
                         RNOMBREMS = "AGOSTO"     
                         RMESANTE  = "JULIO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
           
                 CASE THIS.MES = 9
                         RNOMBREMS = "SETIEMBRE"     
                         RMESANTE  = "AGOSTO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
                      
           		CASE THIS.MES = 10
                         RNOMBREMS = "OCTUBRE"     
                         RMESANTE  = "SETIEMBRE"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
                 
                CASE THIS.MES = 11
                         RNOMBREMS = "NOVIEMBRE"     
                         RMESANTE  = "OCTUBRE"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
                
                CASE THIS.MES = 12
                         RNOMBREMS = "DICIEMBRE"     
                         RMESANTE  = "NOVIEMBRE"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
                  
                  
           
           
           
           ENDCASE 
           
           
           SELECT NESCALA
           USE


        ENDPROC


        PROCEDURE CLCRETN
        PARAMETERS  RNOMBREMS,RMESANTE 
        	    SELECT gancias
           		SUM  &RMESANTE  TO retean FOR concepto =500
           		UPDATE GANCIAS SET  &RNOMBREMS = retencion ; 
				WHERE CONCEPTO = 500  
                UPDATE GANCIAS SET &RNOMBREMS = retean ; 
				WHERE CONCEPTO = 510

        ENDPROC





ENDDEFINE





            









