DEFINE CLASS ofamilia as Custom

		ocanthijos = 0
		oesposa    = 0
		olegajo    = 0
		oempresa   = 0
        oexsite    = 0 

        PROCEDURE existe
     	   SELECT * FROM nlegajo WHERE legajo = this.olegajo .and. empresa = this.olegajo;
     	   INTO CURSOR existe
     	   SELECT existe
     	   IF EOF()    
             * WAIT WINDOW "Error No hay registros  en nlegajo para el legajo :" + STR(this.olegajo,4)
           endif
           use
        endproc  
        

    	PROCEDURE busco
            SET DATE ITALIAN
            SET CENTURY ON
            IF this.olegajo = 0
               WAIT WINDOW "Error Nº legajo en 0"
            ELSE
              * WAIT WINDOW "LEGAJO:" + STR(THIS.OLEGAJO,4)
            ENDIF     
            
            IF this.oempresa = 1 
            	SELECT legajo,nombre,documen,parent,fnac,this.calcuant(DATE(),fnac)as edad  FROM asigfa WHERE legajo = this.olegajo;
            	INTO CURSOR familia
                 
            
            ENDIF
            
            IF this.oempresa = 2
               SELECT * FROM ASIGFA WHERE LEGAJO = this.olegajo; 
               INTO CURSOR FAMILIA  
            ENDIF 
            
        		              
        this.cierro
         try
      		 SELECT FAMILIA
        	 IF .NOT. EOF()
        		this.cuentohijos    
    			this.cuentoespo
    		ENDIF
    	 CATCH  to oException
    	        IF oException.ErrorNo = 13
                WAIT WINDOW "Error No Se Registran Familiares"
             	ENDIF
     			FINALLY 

		ENDTRY 
    	
    	
    	
    	endproc      

        PROCEDURE cierro
          IF USED("asigfa")
          	 SELECT asigfa
          	 use
          ENDIF
        
        endproc    

       PROTECT PROCEDURE cuentohijos
           SELECT COUNT(FAMILIA.LEGAJO) AS CT FROM FAMILIA WHERE FAMILIA.PARENT = "HIJO/A" .AND. EDAD =< 23 ;
           INTO CURSOR CTJ
           
           SELECT CTJ
           IF .NOT. EOF()
               this.ocanthijos = ct
           ENDIF
           SELECT CTJ
           USE    
        
        endproc  
               
        PROTECTED PROCEDURE CUENTOESPO
          SELECT FAMILIA.LEGAJO FROM FAMILIA WHERE PARENT = "CONY";         
          INTO CURSOR ESPO

          SELECT ESPO
          IF .NOT. EOF()
             this.oesposa = 1
          ENDIF   
          USE  
            
        ENDPROC




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
       filio    = 0 
       cancelar = .f.  
         
       * ORDEN DE LLAMADA
       * CALCURET -------->(CALCRET METODO PROTEGIDO) 
       * DEDUPER : deducciones personales  
       * CALCUGNETA :-------------->(CLGN METODO PROTEGIDO)
       * CALCURETEN CALCULA EL IMPUESTO Y LLAMA A (CLCGN METODO PROTEGIDO)
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
        
        
        PROTEC PROCEDURE CALCRET     
        * DESCUENTOS DE OBRA SOCIAL
        * JUBILACION
        * SINDICAL 
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
                   UPDATE GANCIAS SET &NOMBREMES = CALCULA.TREMU*3/100; 
                   WHERE CONCEPTO = 145    
                   UPDATE GANCIAS SET &NOMBREMES = CALCULA.TREMU*1.5/100; 
                   WHERE CONCEPTO = 140    
                   
                   
                   *IF NOMBREMES <> "ENERO"
                   *   SELECT SUM(&MESANTERIOR) AS RETAC FROM GANCIAS WHERE CLASE = 2;
                   *   INTO CURSOR RET           
                   *   UPDATE GANCIAS SET &NOMBREMES = RET.RETAC; 
                   *   WHERE CONCEPTO = 180 
                   *   SELECT RET  
                   *   USE
                   *ENDIF 
        
          CATCH TO ERR
                 WAIT WINDOW "ERROR EN CALCULO DE RETENCIONES DE JUBILACION,OB,SIND " + STR(ERROR(),4) 
                 FINALLY  
                
         ENDTRY
                
        SELECT CALCULA
        USE
        
        
        ENDPROC
        
        
        PROCEDURE DEDUPER
            SELECT * FROM DEDUCCIONES WHERE CONCEPTO = 310;
            INTO CURSOR LISTADE
            
           
            UPDATE GANCIAS SET ENERO = LISTADE.ENERO,; 
                             FEBRERO = LISTADE.FEBRERO,;
                             MARZO   = LISTADE.MARZO,;
                             ABRIL   = LISTADE.ABRIL,;
                             MAYO    = LISTADE.MAYO,;
                             JUNIO   = LISTADE.JUNIO,;
                             JULIO   = LISTADE.JULIO,;
                             AGOSTO  = LISTADE.AGOSTO,;
                           SETIEMBRE = LISTADE.SETIEMBRE,;
                           OCTUBRE   = LISTADE.OCTUBRE,;         
                           NOVIEMBRE = LISTADE.NOVIEMBRE,;
                           DICIEMBRE = LISTADE.DICIEMBRE;
                           WHERE GANCIAS.CONCEPTO = 310                                 
         
                                 
 SELECT * FROM DEDUCCIONES WHERE CONCEPTO = 300;
            INTO CURSOR LISTIMPO
            
           
            UPDATE GANCIAS SET ENERO = LISTIMPO.ENERO,; 
                             FEBRERO = LISTIMPO.FEBRERO,;
                             MARZO   = LISTIMPO.MARZO,;
                             ABRIL   = LISTIMPO.ABRIL,;
                             MAYO    = LISTIMPO.MAYO,;
                             JUNIO   = LISTIMPO.JUNIO,;
                             JULIO   = LISTIMPO.JULIO,;
                             AGOSTO  = LISTIMPO.AGOSTO,;
                           SETIEMBRE = LISTIMPO.SETIEMBRE,;
                           OCTUBRE   = LISTIMPO.OCTUBRE,;         
                           NOVIEMBRE = LISTIMPO.NOVIEMBRE,;
                           DICIEMBRE = LISTIMPO.DICIEMBRE;
                           WHERE GANCIAS.CONCEPTO = 300
           
        
        
        ENDPROC
        
        PROCEDURE ACTUIMPOACARGO
        * ACTUALIZA IMPORTE FAMILIARES A CARGO 
          SELECT * FROM DEDUCCIONES WHERE CONCEPTO = 350;
          INTO CURSOR LISTDEDU
          
          UPDATE GANCIAS SET ENERO = LISTDEDU.ENERO,; 
                             FEBRERO = LISTDEDU.FEBRERO*GANCIAS.UNIDADES,;
                             MARZO   = LISTDEDU.MARZO*GANCIAS.UNIDADES,;
                             ABRIL   = LISTDEDU.ABRIL*GANCIAS.UNIDADES,;
                             MAYO    = LISTDEDU.MAYO*GANCIAS.UNIDADES,;
                             JUNIO   = LISTDEDU.JUNIO*GANCIAS.UNIDADES,;
                             JULIO   = LISTDEDU.JULIO*GANCIAS.UNIDADES,;
                             AGOSTO  = LISTDEDU.AGOSTO*GANCIAS.UNIDADES,;
                           SETIEMBRE = LISTDEDU.SETIEMBRE*GANCIAS.UNIDADES,;
                           OCTUBRE   = LISTDEDU.OCTUBRE*GANCIAS.UNIDADES,;         
                           NOVIEMBRE = LISTDEDU.NOVIEMBRE*GANCIAS.UNIDADES,;
                           DICIEMBRE = LISTDEDU.DICIEMBRE*GANCIAS.UNIDADES;
                           WHERE GANCIAS.CONCEPTO = 350 .AND. UNIDADES <> 0 
        
           SELECT LISTDEDU
           USE
                
        ENDPROC
        
        
        
        
        
        
        
        PROCEDURE DEDUPER1
           
          SELECT IMPORTE AS GNIP   FROM DEDUGR WHERE CONCEPTO = 310;
          INTO CURSOR GANOIP
          SELECT  IMPORTE AS DEDUI FROM DEDUGR WHERE CONCEPTO =  300;
          INTO CURSOR DEDUES 
          
          SELECT GANCIAS
          
          P = 4
          * I = 5 PARA CARGAR DESDE ENERO
          * REFORMADO PARA PODER CALCULAR DESDE ABRIL 2011
          *
          FOR I = 8 TO 16
             IF I = 5          
                 TRY
                   REPLACE (FIELD(I)) WITH (GANOIP.GNIP/12) FOR CONCEPTO = 310 
                   REPLACE (FIELD(I)) WITH (DEDUES.DEDUI/12) FOR CONCEPTO = 300  
                 CATCH TO E
                    WAIT WINDOW "ERRO EN DEDUCCIONES PERSONALES " + STR(ERROR(),4)
                    FINALLY
                 ENDTRY
              
             ELSE
                TRY
                   REPLACE (FIELD(I)) WITH (GANOIP.GNIP/12)*P FOR CONCEPTO = 310
                   REPLACE (FIELD(I)) WITH (DEDUES.DEDUI/12)*P FOR CONCEPTO = 300
               CATCH TO LO
                   LO.USERVALUE = "ERROR"
                   IF LO.Errorno = 1539 
                        MESSAGEBOX("ERROR TABLA DE SOLO LECTURA",0,"ATENCION")
                        TABLEREVERT()
                   ENDIF
                   this.cancelar = .t.
                   FINALLY        
               ENDTRY
               
              ENDIF
              IF this.cancelar = .t.
                 EXIT FOR
              ENDIF   
                          
               
              P = P + 1 
          NEXT      
        
        
        
        
        
           SELECT GANOIP
           USE
           SELECT DEDUES
           USE
           SELECT DEDUGR 
           USE
        
        ENDPROC
          
        PROCEDURE AGRECONYUGE
           
            SELECT * FROM DEDUCCIONES WHERE CONCEPTO = 320;
            INTO CURSOR LISTESPO
            
           
            UPDATE GANCIAS SET ENERO = LISTESPO.ENERO,; 
                             FEBRERO = LISTESPO.FEBRERO,;
                             MARZO   = LISTESPO.MARZO,;
                             ABRIL   = LISTESPO.ABRIL,;
                             MAYO    = LISTESPO.MAYO,;
                             JUNIO   = LISTESPO.JUNIO,;
                             JULIO   = LISTESPO.JULIO,;
                             AGOSTO  = LISTESPO.AGOSTO,;
                           SETIEMBRE = LISTESPO.SETIEMBRE,;
                           OCTUBRE   = LISTESPO.OCTUBRE,;         
                           NOVIEMBRE = LISTESPO.NOVIEMBRE,;
                           DICIEMBRE = LISTESPO.DICIEMBRE;
                           WHERE GANCIAS.CONCEPTO = 320
        
        
           SELECT LISTESPO
           USE
        
        
        ENDPROC
        
        
        PROCEDURE AGRECONYUGEVIEJO
        
           SELECT IMPORTE AS CONYU   FROM DEDUGR WHERE CONCEPTO = 320;
           INTO CURSOR CONYUG
           SELECT GANCIAS

           P = 1
           FOR I = 5 TO 16
             IF I = 5          
                 REPLACE (FIELD(I)) WITH (CONYUG.CONYU/12) FOR CONCEPTO = 320 
                 
              ELSE
                 REPLACE (FIELD(I)) WITH (CONYUG.CONYU/12)*P FOR CONCEPTO = 320
                 
              ENDIF 
              P = P + 1 
           NEXT 
        
        
        
          SELECT CONYUG
          USE
          SELECT DEDUGR
          USE 
        
        
        ENDPROC
        
        PROCEDURE AGREHIJO
            SELECT * FROM DEDUCCIONES WHERE CONCEPTO = 330;
            INTO CURSOR LISTHIJO
            
           
            UPDATE GANCIAS SET ENERO = LISTHIJO.ENERO     * THIS.FILIO,; 
                             FEBRERO = LISTHIJO.FEBRERO   * THIS.FILIO,;
                             MARZO   = LISTHIJO.MARZO     * THIS.FILIO,;
                             ABRIL   = LISTHIJO.ABRIL     * THIS.FILIO,;
                             MAYO    = LISTHIJO.MAYO      * THIS.FILIO ,;
                             JUNIO   = LISTHIJO.JUNIO     * THIS.FILIO,;
                             JULIO   = LISTHIJO.JULIO     * THIS.FILIO,;
                             AGOSTO  = LISTHIJO.AGOSTO    * THIS.FILIO,;
                           SETIEMBRE = LISTHIJO.SETIEMBRE * THIS.FILIO,;
                           OCTUBRE   = LISTHIJO.OCTUBRE   * THIS.FILIO,;         
                           NOVIEMBRE = LISTHIJO.NOVIEMBRE * THIS.FILIO,;
                           DICIEMBRE = LISTHIJO.DICIEMBRE * THIS.FILIO;
                           WHERE GANCIAS.CONCEPTO = 330                                 
 
            SELECT LISTHIJO
            USE
        
        ENDPROC
        
        
        
        PROCEDURE AGREHIJOVIEJO
         
           SELECT IMPORTE AS H   FROM DEDUGR WHERE CONCEPTO = 330;
           INTO CURSOR HIJOS
           SELECT GANCIAS

        
           P = 1
           FOR I = 5 TO 16
             IF I = 5          
                 REPLACE (FIELD(I)) WITH (HIJOS.H/12) * THIS.FILIO FOR CONCEPTO = 330 
                 
              ELSE
                 REPLACE (FIELD(I)) WITH ((HIJOS.H/12)*P) * THIS.FILIO FOR CONCEPTO = 330
                 
              ENDIF 
              P = P + 1 
           NEXT 
        
           SELECT HIJOS
           USE
           SELECT DEDUGR
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
        
        PROTECTED PROCEDURE CLCGN
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
                   IF escala.a > this.sjtoaret .or. escala.a = 0
                      *WAIT WINDOW STR(ESCALA.PORCENTAJE,2) 
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
                         UPDATE GANCIAS SET ENERO = retencion ; 
						 WHERE CONCEPTO = 600   
               
               CASE THIS.MES = 2
                	     RNOMBREMS = "FEBRERO"     
                         RMESANTE  = "ENERO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)
               CASE THIS.MES = 3
                         RNOMBREMS = "MARZO"     
                         RMESANTE  = "FEBRERO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE) 
                	     
                CASE THIS.MES = 4
                	     RNOMBREMS = "ABRIL"     
                         RMESANTE  = "MARZO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE) 
                	       
                CASE THIS.MES = 5
                	     RNOMBREMS = "MAYO"     
                         RMESANTE  = "ABRIL"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE) 
                	      
                 CASE THIS.MES = 6
                	     RNOMBREMS = "JUNIO"     
                         RMESANTE  = "MAYO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)  
                
                 CASE THIS.MES = 7
                	     RNOMBREMS = "JUlIO"     
                         RMESANTE  = "JUNIO"
                         THIS.CLCRETN( RNOMBREMS,RMESANTE)  
                	     
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


        PROTEC PROCEDURE CLCRETN
        PARAMETERS  RNOMBREMS,RMESANTE 
        	    TRY
        	       
        	       SELECT gancias
           		   SUM  &RMESANTE  TO retean FOR concepto =500
           		   UPDATE GANCIAS SET  &RNOMBREMS = retencion ; 
				   WHERE CONCEPTO = 500  
                   UPDATE GANCIAS SET &RNOMBREMS = retean ; 
				   WHERE CONCEPTO = 510
                   UPDATE GANCIAS SET &RNOMBREMS =  retencion - retean;
                   WHERE CONCEPTO = 600
                                
               CATCH TO e
                      WAIT WINDOW "ERROR EN ACTUALIZACION DE CONCEPTO 510,500" + " " + STR(e.Errorno,4)
                      FINALLY
                
               ENDTRY 
                   



        ENDPROC





ENDDEFINE


DEFINE CLASS CARGOSUE as custom

      mes = 0
      archivo = " "
      LEGAJO =0
      sueldo = 0
      sac    = 0
           
      
     PROCEDURE crgosueldo
            LOCAL existe 
            LOCAL campo2              
            existe = 0
            TRY
            	SELECT 0
            	USE "c:\suerut\empre1\" +(this.archivo) ALIAS liquida
         	CATCH TO oException
         	     IF oException.ErrorNo = 1
         	        MESSAGEBOX("ARCHIVO DE LIQUIDACION INEXSTENTE" ,0, "ERROR")   
         	     ENDIF 
         	     existe = 1
         	     
         	     FINALLY
         	ENDTRY
         	
         	IF existe = 1
         	   return
         	endif
         	   	
         	    	        	
         	
         	
         	fcampo = 0
        	SELECT SUM(APORTE) AS SU FROM liquida WHERE LEGAJO = THIS.LEGAJO  INTO CURSOR SUELDO
        	SELECT SUM(SINAPORTE) AS VIAT FROM liquida WHERE LEGAJO = THIS.LEGAJO INTO CURSOR VIATICOS
            select legajo,sum(aporte) AS APORTE,sum(iif(CONCEPTO=18,aporte,0)) AS SAC from liquida where legajo = this.legajo GROUP BY legajo;
            INTO CURSOR SAC
        	IF .NOT. ISNULL (SAC.SAC)
            	this.sueldo = sueldo.su - sac.sac
    	    	this.sac  = sac.sac
            ELSE
        	    this.sueldo = su.sueldo    
        	ENDIF
        	
        	fcampo = this.mes + 4
            campo2 = (FIELD(fcampo,"GANCIAS",1))
            
            
            IF ISNULL(this.sueldo) = .F.
            
            	WAIT WINDOW STR(SUELDO.SU,7) + "TRABAJANDO EN LEGAJO : " + STR(GANCIAS.LEGAJO,4)  NOWAIT
            	SELECT GANCIAS   
            	TRY
                	UPDATE GANCIAS SET &campo2 = THIS.SUELDO       WHERE CONCEPTO = 1  .AND. ISNULL(DIRLEG)
               		*   UPDATE GANCIAS SET &campo2 = THIS.SAC          WHERE CONCEPTO = 4  .AND. ISNULL(DIRLEG)        
                	UPDATE GANCIAS SET &campo2 =  VIATICOS.VIAT    WHERE CONCEPTO = 40  .AND. ISNULL(DIRLEG)  
                    UPDATE GANCIAS SET &campo2 = THIS.SUELDO       WHERE CONCEPTO = 3   .AND.  .NOT.ISNULL(DIRLEG)       
            	CATCH TO OEXCEP
                	WAIT WINDOW oexcep.message + STR(GANCIAS.LEGAJO,4)
                
            
            	ENDTRY
            ENDIF
            SELECT SUELDO
       		USE
        	SELECT VIATICOS
        	USE
        	SELECT LIQUIDA
        	USE
        	SELECT SAC
        	USE
            
     
     ENDPROC
     
     
     PROCEDURE PRORRATEO1
            SAC = 0
            SELECT GANCIAS
            SUM ENERO TO SAC FOR CONCEPTO = 4                
            
   		   	TRY
              UPDATE GANCIAS SET ENERO   = SAC/6 WHERE CONCEPTO = 4
              UPDATE GANCIAS SET FEBRERO = SAC/6 WHERE CONCEPTO = 4 
              UPDATE GANCIAS SET MARZO   = SAC/6 WHERE CONCEPTO = 4
              UPDATE GANCIAS SET ABRIL   = SAC/6 WHERE CONCEPTO = 4  
              UPDATE GANCIAS SET MAYO    = SAC/6 WHERE CONCEPTO = 4   
              UPDATE GANCIAS SET JUNIO   = SAC/6 WHERE CONCEPTO = 4
      		CATCH TO OEXECP
         
            	WAIT WINDOW oexcep.message  
      
      		ENDTRY
     
     
     
     
     ENDPROC
     
    PROCEDURE PRORRATEO2
            SAC = 0
            SELECT GANCIAS
            SUM JULIO TO SAC FOR CONCEPTO = 4                
            
   		   	TRY
              UPDATE GANCIAS SET JULIO       = SAC/6 WHERE CONCEPTO = 4
              UPDATE GANCIAS SET AGOSTO      = SAC/6 WHERE CONCEPTO = 4 
              UPDATE GANCIAS SET SETIEMBRE   = SAC/6 WHERE CONCEPTO = 4
              UPDATE GANCIAS SET OCTUBRE     = SAC/6 WHERE CONCEPTO = 4  
              UPDATE GANCIAS SET NOVIEMBRE   = SAC/6 WHERE CONCEPTO = 4   
              UPDATE GANCIAS SET DICIEMBRE   = SAC/6 WHERE CONCEPTO = 4
      		  
      		CATCH TO OEXECP
         
            	WAIT WINDOW oexcep.message  
      
      		ENDTRY
     
     
     
     
     ENDPROC
	 


ENDDEFINE


DEFINE CLASS VISUREC AS Custom

   archivo = "  "
   legajo  = 0
   liquida = 0
   cancelar = .t.
  
   
   PROCEDURE veorec
     TRY
         SELECT 0
         USE (this.archivo) ALIAS liqsu
         SELECT * FROM  liqsu WHERE legajo=this.legajo;
         .and. liquida = this.liquida ORDER BY concepto INTO cursor recibo READWRITE
         SELECT liqsu
         use
    CATCH TO e
         
         MESSAGEBOX ("Error",0,"NO SE ENENCUENTRA EL ARCHIVO ERROR Nº" + " " + CURDIR()+ STR(ERROR(),4) )
         this.cancelar = .f.
      
    ENDTRY
   
   
   ENDPROC   

  







ENDDEFINE




DEFINE CLASS CONCEPTOS as custom
 codigo  =  0
 ano     =  0
 legajo  =  0 
 empresa =  0
 aid     =  0 
 cancelar = .f.
 existeconp  = 0

* PROTECTED FUNCTION codigo_Assign (vcodigo)
 
  
*   this.codigo = vcodigo
*   
*   SELECT * FROM NCONCEPTOS WHERE CONCEPTO = vcodigo;
*   INTO CURSOR EXISTE
*   SELECT EXISTE
*   IF RECCOUNT()= 0
*      MESSAGEBOX("Concepto Inexsitente =" + STR(vcodigo,4),0,  "Error")
*      this.cancelar = .t.
*   ELSE
*      this.codigo = vcodigo
*   ENDIF   
*   SELECT EXISTE
*   USE
*   SELECT NCONCEPTOS
*   USE
*   return
   
   
 *endfunc




    PROCEDURE agregar
      IF this.cancelar = .t.
         RETURN
      ENDIF   
      
      this.existe  
      this.creoid
     
     
     
      IF this.existeconp = 0
      
          TRY
               INSERT INTO nlegajo(legajo,concepto,ano,empresa,id);
               VALUES (this.legajo,this.codigo,this.ano,this.empresa,this.aid)  
            
          CATCH TO e
             WAIT WINDOW "Error en Inserción de Concepto en legajo : " + STR(this.legajo,4) + " " + STR(this.concepto,4)
   
          FINALLY
          ENDTRY
      ENDIF    
    ENDPROC


    PROCEDURE CREOID
        LOCAL xstr
       
        xstr = LTRIM(STR(this.ano,4))+ LTRIM(STR(this.LEGAJO,4))+ LTRIM(STR(this.codigo,4))+ STR(this.empresa,1)
       
        this.aid = VAL(xstr)
        
    ENDPROC
   


    PROCEDURE EXISTE
       SELECT legajo ,concepto FROM nlegajo WHERE ano = this.ano .and. empresa = this.empresa .and. concepto = this.codigo .and. legajo = this.legajo;
       INTO CURSOR existe
       SELECT existe
       IF .NOT. EOF()
          this.existeconp = 1
       ELSE
          this.existeconp = 0
       ENDIF
       SELECT EXISTE
       USE   
       
    
    ENDPROC  











   PROCEDURE ACTUGRAL
   
        IF .NOT. USED("nconceptos")
            SELECT 0
            USE NCONCEPTOS
        ENDIF
        
        SELECT NCONCEPTOS
        DO WHILE .NOT. EOF()        
          
           this.codigo = concepto
           this.agregar
           SELECT nconceptos
           SKIP
        ENDDO   
   
      
   ENDPROC



ENDDEFINE




DEFINE CLASS ACTUCONP AS CONCEPTOS
   mes = 0 
   
 
   PROTECTED FUNCTION mes_Assign (vmes)
 
     IF vmes < 0 .or. vmes > 12
        MESSAGEBOX("Asignación Errónea de mes" + STR(vmes,2),16,"Error")
        this.error
     ELSE
        this.mes = vmes 
       
        
     ENDIF
   ENDFUNC
   
   

   PROCEDURE INIT
      
   
   ENDPROC
 
 
   PROCEDURE ASIGNA
   
     FOR i= this.mes TO 12
     
     
     next   
   
   
   
   
   ENDPROC
 
 
 
 
 
 
 
 
 
 
 
 




ENDDEFINE



DEFINE CLASS INFOGA AS Custom
 mes = " "
 vempre  = 0
 vfecha  = DATE()
 expcel  = 0 
 exptotxt = 0  
    	PROCEDURE init
     		SET DATE YMD
     		SET CENTURY ON 
             
		endproc
 		
 		
 		PROCEDURE GENERAR
 			wmes = " "
 			wmes = this.mes
 			WAIT WINDOW wmes
 			
 			SELECT legajo,SUM(IIF(CLASE= 1 .OR. CLASE = 8,&wmes,0))AS BASELQ,SUM(IIF(CONCEPTO = 500 ,&wmes,0))as &wmes ,SUM(IIF(CONCEPTO = 500 ,&wmes,0))- SUM(IIF(CONCEPTO = 510 ,&wmes,0)) as ret  FROM nlegajo;
			WHERE ano = 2011 .AND. EMPRESA = this.vempre  GROUP BY legajo INTO CURSOR RETCUA
            SELECT retcua
            browse
 
			SELECT R.LEGAJO,P.NOMBRE,P.CUIL,P.CALLE,;
			P.NRO,P.LOCALIDAD,P.PROVINCIA, R.BASELQ,R.RET FROM PERSONAL AS P  INNER JOIN RETCUA  AS R ON p.legajo = r.legajo ORDER BY r.legajo INTO CURSOR INFR
 
			SELECT  n.legajo as legajo, n.concepto,&wmes,c.clase,n.empresa  FROM nlegajo as n INNER JOIN nconceptos;
			as c ON c.concepto = n.concepto WHERE N.ANO = 2011 .AND. C.CLASE = 1 .AND. n.EMPRESA = this.vempre ORDER BY n.legajo INTO CURSOR HABER   
			 
			SELECT legajo,SUM(&wmes) AS HABER FROM HABER WHERE clase = 1 GROUP BY  legajo INTO CURSOR BASE 


			SELECT  n.legajo, n.concepto,&wmes,c.clase,n.empresa  FROM nlegajo as n INNER JOIN nconceptos;
			as c ON c.concepto = n.concepto WHERE N.ANO = 2011 .AND. EMPRESA= this.vempre .AND. C.CLASE = 8 ORDER BY n.legajo INTO CURSOR SINAPORTE


			SELECT legajo,SUM(&wmes)AS HSAP FROM SINAPORTE WHERE clase = 8   GROUP BY  legajo INTO CURSOR SINAP 

			SELECT base.legajo,base.haber AS HABER ,sinap.hsap AS VIATICO from base INNER JOIN sinap ON base.legajo = sinap.legajo;
			INTO CURSOR sueldo
			SELECT INFR.LEGAJO,INFR.NOMBRE,INFR.CUIL,INFR.CALLE,;
			INFR.NRO,INFR.LOCALIDAD,INFR.PROVINCIA, INFR.RET,SUELDO.HABER,SUELDO.VIATICO;
			FROM INFR INNER JOIN SUELDO  ON SUELDO.LEGAJO = INFR.LEGAJO INTO CURSOR INFOFIN READWRITE
			UPDATE INFOFIN SET CUIL = THIS.PASOCUIL(CUIL)
          
            SELECT RETCUA
            USE
            SELECT INFR
            USE    
            SELECT HABER
            USE
            SELECT BASE
            USE
            SELECT SINAPORTE
            USE
            SELECT SINAP
            USE
            SELECT SUELDO 
            USE 
            SELECT infofin
            browse
           
            IF this.exptotxt = 1
               this.exporta    
            ENDIF
            IF this.expcel = 1
                this.aexcel
            ENDIF
       
        ENDPROC 
 

        ******************
        PROCEDURE PASOCUIL
        *****************
        	PARAMETERS VCUIL
        	*VCUIL = INFR.CUIL
         	N = " "
			I = 1
			DO WHILE  I< 15
    			 X = SUBSTR(VCUIL,I,1) 
   
   				IF X$"0123456789"
   				  N = N + X
   				ENDIF     
   				I = I + 1
			ENDDO   
    
		RETURN N
       ENDPROC
       
       
       
       
       *****************
       PROCEDURE EXPORTA
       ****************
       
        SELECT INFOFIN   
        SET FILTER TO RET <> 0
		SET DEVICE TO SCREEN
		DELETE FILE "C:\SUERUT\EMPRE1\DGI.TXT"
		SET DEVICE TO FILE "C:\SUERUT\EMPRE1\DGI.TXT"
        wfecha = DATE()
        wfecha = this.vfecha
        *WAIT WINDOW this.vfecha
		WCOMPRO = " "
		lin = 1 
		SELECT INFOFIN
		GO TOP
		DO WHILE .NOT. EOF()
   			@LIN,0  SAY "07" 
   			@LIN,2  SAY this.vfecha
   			WCOMPRO = LTRIM(STR(MONTH(CTOD(this.vfecha)),2)) + LTRIM(STR(LEGAJO,4))
   			@LIN,12 SAY WCOMPRO
  			 *            123456798-123456    
   			@LIN,28  SAY "0000000000000.00"
   			@LIN,44  SAY "217"
   			@LIN,47  SAY "160"
   			@LIN,50  SAY "1"
   			*BASE DE CALCULO
   			@LIN,51  SAY "00000000000.00"
   			@LIN,65  SAY this.vfecha
   			@LIN,75  SAY "01"
   			@LIN,77  SAY "0"
   			@LIN,78  SAY RET PICTURE "99999.99"
   			@LIN,92  SAY "000000"
   			@LIN,98  SAY " "
			@LIN,108 SAY "86"
   			@LIN,110 SAY CUIL
  			@LIN,130 SAY "0000000000000"
   			@LIN,144 SAY " "
   			@LIN,174 SAY "0"
  			@LIN,175 SAY " "
   			@LIN,186 SAY " "  
    		SKIP
   			 LIN = LIN + 1
		ENDDO

	 	SET DEVICE TO SCREEN
		SET SAFETY OFF
    
		MODIFY FILE C:\SUERUT\EMPRE1\DGI.TXT

    ENDPROC   

    PROCEDURE AEXCEL
       SELECT INFOFIN
       TRY
        COPY TO GETFILE('XLS', 'Guardar archivo .XLS:',   'Guardar', 1, 'Guardar reporte en...') type XL5 
      CATCH TO excepc
        WAIT WINDOW "Error " + excepc.Message        

      ENDTRY
    
    
                  

    ENDPROC   

   PROCEDURE error (nError,cMethod,nline) 
     
     WAIT WINDOW "Error" + CHR(9) + STR(nError,4)+ " " + "En el Metodo" + cMethod + " " + "linea : "+STR(nline,4)
    
   ENDPROC



   PROCEDURE DESTROY
    SELECT INFOFIN
    USE
   
   
   
   ENDPROC









   

ENDDEFINE




DEFINE CLASS CARGENERAL AS CARGOSUE
 empresa = 0
 año     = 0

   PROCEDURE RECORRO
     SELECT LEGAJO,NOMBRE FROM PERSONAL WHERE ACTIVO = "A" INTO CURSOR PERSO
     SELECT PERSO
     GO TOP
     DO WHILE .NOT. EOF()
        SELECT GANCIAS
        parlegajo  = PERSO.LEGAJO
   		parempresa = this.empresa  
   		parno     = this.año
        REQUERY()
        THIS.CRGOSUELDO
        WAIT WINDOW PERSO.NOMBRE NOWAIT
        SELECT PERSO
       
        SKIP
     
     ENDDO
   
   
   ENDPROC    







ENDDEFINE


















