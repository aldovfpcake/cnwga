    
DEFINE CLASS liquianual as Custom   
     RemExenta = 0
	 RemuBruta = 0
	 RemuBrutaSujetaAporte = 0
	 RemuComputable = 0
	 RmuNoAlc = 0
	 ArtDeduEspecial = 0
	 ArtDeduEsposa = 0
	 ArtDeduGananciaNoImpo = 0
	 ArtDeduHijo = 0
	 ArtDeduOtrasCargas = 0
	 DeduAporteJubilatorio = 0
	 DeduCtaMedicoAsistencial = 0
	 TopeCtaMedicoAsistencial =0
	 DeduCtaSindical = 0
	 DeduDonaciones = 0
	 DeduGastosMedicos = 0
	 TopeGastosMedicos = 0
	 TopeDeduDonaciones = 0
	 TotalRemuneta = 0
	 DeduGastosSepelio = 0
	 TopeGastosSepelio = 0
	 DeduLey19032 =0
	 DeduHonorariosMedicos = 0
	 DeduInteresesHipotecarios = 0
	 TopeInteresesHipotecarios =0
	 DeduObraSocial = 0
	 DeduPrimaSeguroDeVida = 0
	 ImpDeterm = 0
	 ImpRetenido = 0
	 PagoACuenta = 0
	 RemuSujetaAImp = 0
	 SaldoEmpleado = 0
	 SaldoAfip = 0
	 TotalDeducciones = 0
	 TotalDeduccionesArt = 0
	 RemuNeta = 0
	 nombre = " "
	 Cuil   = " "
	 
	 legajo =0 
	 Año = 0 
	 Empresa = 0
	 PROCEDURE Init(ParmLegajo,ParmAno,ParmEmpresa)
	   This.Año = ParmAno   
	   This.legajo = Parmlegajo
	   This.Empresa = ParmEmpresa   
	   this.creocursor
	   this.busconombre
	   this.DetermRemBrutaSjta
	   this.TotalRemubruta  
	   this.TotalObrasocial
	   this.TotalSindical
	   this.TotalJubilatiorios
	   this.CalcularNeta
	   this.TotalMedicoAsistencial
	   this.TotalGastosMedicos
	   this.TotalDeduleyVeinteTreintaydos 
	   this.TotalDonaciones
	   this.TotalIntHipo
	   this.TotalGastosSepelio 
	   this.TotalArt23
	   this.Topecinco
	   this.CalcularTotaldeducciones
	   this.CalcularTotalDedu23
	   this.CalculaRemusjta
	   this.CalculaRetencion
	   this.CalculaImporteRetenido
  	   this.Saldo
   	   this.grabar
   	 *  this.ImpDeterm = 0
	 *  this.ImpRetenido = 0
	 *  this.SaldoEmpleado = 0
	 *  this.SaldoAfip = 0
	 *  this.CalcularTotaldeducciones
	 *  this.CalcularTotalDedu23
	 *  this.CalculaRemusjta
	 *  this.CalculaRetencion
	 *  this.CalculaImporteRetenido
	 *  this.Saldo
	 ENDPROC
	 
	 
	 
    	 *SELECT n.enero,c.concepto FROM nlegajo n INNER JOIN nconceptos c ON n.concepto = c.concepto WHERE  n.legajo = 212 .and. c.clase = 1

	      
	 PROCEDURE TotalRemubruta
			 SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
			 FROM ;
     		 ganancias!nlegajo ;
    		 INNER JOIN ganancias!nconceptos ;
   			 ON  Nlegajo.concepto = Nconceptos.concepto;
 			 WHERE  Nlegajo.legajo = this.legajo;
   			 AND  Nlegajo.empresa = this.Empresa;
   			 AND  Nlegajo.ano = this.Año;
             AND  INLIST( Nconceptos.clase,1,8);
             INTO CURSOR informe
             this.RemuBruta = informe.total
             SELECT informe
             use            
             
             INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Remun. Bruta" ,this.cuil,this.Año,this.Remubruta,1)

	 ENDPROC    
	 
    PROCEDURE DetermRemBrutaSjta
            
            SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
            AND  INLIST( Nconceptos.clase,1);
            INTO CURSOR informe
            this.RemuBrutaSujetaAporte = informe.total
            SELECT informe
            use            
             

    ENDPROC






	 
	PROCEDURE TotalObraSocial 
			
			this.DeduObraSocial = this.RemuBrutaSujetaAporte*0.03
	        this.DeduLey19032   = this.RemuBrutaSujetaAporte*0.03 	 
            INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,this.nombre,this.cuil,this.Año,this.DeduObraSocial,2)
	 
	ENDPROC 
	 
	PROCEDURE TotalSindical 
			
   			this.DeduCtaSindical = this.RemuBrutaSujetaAporte*0.03
			
	        INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Cta. Sindical",this.cuil,this.Año,this.DeduCtaSindical,2)


	ENDPROC  
	
	PROCEDURE TotalJubilatiorios 
			
   			this.DeduAporteJubilatorio = this.RemuBrutaSujetaAporte*0.11
			INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Aporte Jubilatorio",this.cuil,this.Año,this.DeduAporteJubilatorio,2)
	 
	ENDPROC
	
	PROCEDURE TotalGastosSepelio 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 140;
   			INTO CURSOR informe 
			if informe.total > 996.23
			   this.DeduGastosSepelio = 996.23
               TopeGastosSepelio = 1
			else     			   
			   this.DeduGastosSepelio = informe.total
			endif 
			SELECT informe
            use 
	        INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Gastos Sepelio",this.cuil,this.Año,this.DeduGastosSepelio,2)   
	ENDPROC
	
	PROCEDURE TotalDeduleyVeinteTreintaydos 
			this.DeduLey19032 = this.RemuBrutaSujetaAporte*0.03
			INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"ley 19032",this.cuil,this.Año,this.Deduley19032,2)  
	ENDPROC
	
	PROCEDURE CalculaRetencion
	   
	    SELECT * FROM escala2017 WHERE BETWEEN(this.RemuSujetaAImp,DE,A) INTO CURSOR GESCALA
	    
        Nsaldo = this.RemuSujetaAImp -GESCALA.excedente
        Porc = (Nsaldo*GESCALA.porcentaje/100)
       
        this.ImpDeterm = Porc + GESCAlA.suma 		
	    select gescala
		use
	    IF this.RemuSujetaAImp > 320000
	        Nsaldo = 0
	        Nsaldo =  this.RemuSujetaAImp - 320000
	        Porc = 0
	        Porc = (Nsaldo*35)/100
	        this.ImpDeterm = Porc+ 71400
	    
	    ENDIF
         IF NOT ISNULL(this.ImpDeterm)	    
	     	INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,this.nombre,this.cuil,this.Año,this.ImpDeterm,3) 
	     ENDIF  
	ENDPROC
	
	
	
	
	
	
	

    PROCEDURE TotalMedicoAsistencial 
			SELECT Nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 362;
   			INTO CURSOR informe 
   			if .not. isnull(informe.total)
				this.DeduCtaMedicoAsistencial= informe.total
			endif
			SELECT informe
            use 
	        INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Cta Medico Asist",this.cuil,this.Año,this.DeduCtaMedicoAsistencial,2) 
	ENDPROC
    PROCEDURE TotalDonaciones 
			SELECT Nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 363;
   			INTO CURSOR informe 
			if .not. isnull(informe.total)
				this.DeduDonaciones= informe.total
			endif
			SELECT informe
            use 
	        INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Donaciones",this.cuil,this.Año,this.DeduDonaciones,2) 

	ENDPROC

    PROCEDURE TotalIntHipo
            SELECT Nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 360;
   			INTO CURSOR informe
			resu = 0
            if .not. isnull(informe.total)			
				if informe.total > 20000
					this.DeduInteresesHipotecarios = 20000
					this.TopeInteresesHipotecarios=1   
				else
					this.DeduInteresesHipotecarios= informe.total
				endif
			endif	
			SELECT informe
            use    
            INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Hijos",this.cuil,this.Año,this.DeduInteresesHipotecarios,2)
     ENDPROC

    PROCEDURE TotalArt23
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 310;
   			INTO CURSOR informe 
   			this.ArtDeduGananciaNoImpo= informe.total
			SELECT informe
            use  
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 300;
   			INTO CURSOR informe 
   			this.ArtDeduEspecial= informe.total
			SELECT informe
            use
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 350;
   			INTO CURSOR informe 
   			this.ArtDeduOtrasCargas= informe.total
			SELECT informe
            use
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 320;
   			INTO CURSOR informe 
   			this.ArtDeduEsposa= informe.total
			SELECT informe
            use
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 330;
   			INTO CURSOR informe 
   			this.ArtDeduHijo= informe.total
            SELECT informe
            use
	        SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 350;
   			INTO CURSOR informe 
   			this. ArtDeduOtrasCargas= informe.total
            SELECT informe
            use
            SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 361;
   			INTO CURSOR informe 
   			this.DeduPrimaSeguroDeVida = informe.total
            SELECT informe
            use 	
	ENDPROC		
    
	PROCEDURE CALCULARNETA
	        
			 this.RemuNeta =  this.Remubruta - (this.DeduObrasocial + this.DeduCtaSindical+this.DeduAporteJubilatorio+ this.DeduLey19032)
             
			 
             INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Remun Neta" ,this.cuil,this.Año,this.RemuNeta,1)
	
	
	ENDPROC
	
	
	PROCEDURE CALCULARTOTALDEDUCCIONES
	    this.VerificarNul 
	     
	    this.TotalDeducciones = this.DeduAporteJubilatorio + this.DeduCtaMedicoAsistencial+ this.DeduCtaSindical +this.DeduDonaciones + this.DeduGastosSepelio + this.DeduHonorariosMedicos + this.DeduInteresesHipotecarios + this.DeduObraSocial;
	                        	+ this.DeduPrimaSeguroDeVida + this.DeduLey19032+ this.DeduGastosMedicos
		
	ENDPROC
	
	PROCEDURE CALCULARTOTALDEDU23
	
	     this.TotalDeduccionesArt = this.ArtDeduGananciaNoImpo + this.ArtDeduEspecial + this.ArtDeduEsposa+ this.ArtDeduHijo + this.ArtDeduOtrasCargas
	
	ENDPROC
	
	
    PROCEDURE CALCULAREMUSJTA	
	
	     this.RemuSujetaAImp  = this.RemuBruta -(this.TotalDeducciones + this.TotalDeduccionesArt) 
	
	
	ENDPROC


    PROCEDURE CalculaImporteRetenido
  	        SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 605;
   			INTO CURSOR informe 
   			this.ImpRetenido= informe.total
			SELECT informe
            use    
	        INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"Importe Retendio" ,this.cuil,this.Año,this.ImpRetenido,1) 
	 
	 
	ENDPROC 
	 
	 
	PROCEDURE Saldo
	         
	         if this.ImpDeterm > this.ImpRetenido
	            this.SaldoAfip     = this.ImpDeterm - this.ImpRetenido  
	         else
	            this.SaldoEmpleado = this.ImpRetenido -this.ImpDeterm

	         endif    
	ENDPROC 
	 
	PROCEDURE TopeCinco
	        
            TopeCinco = 0	        
			TopeCinco = this.Remuneta*0.05 
	        if this.DeduDonaciones > TopeCinco
			   this.TopeDeduDonaciones = 1
	           this.DeduDonaciones = TopeCinco
			   this.Calculartotaldeducciones
            endif    			   
			
			if this.DeduGastosMedicos >TopeCinco
			   this.TopeGastosMedicos = 1
	           this.DeduGastosMedicos = TopeCinco 
	           this.Calculartotaldeducciones
	        endif
			
			if this.DeduCtaMedicoAsistencial > TopeCinco
			   this.TopeCtaMedicoAsistencial = 1
			   this.DeduCtaMedicoAsistencial = TopeCinco
			   this.Calculartotaldeducciones
			endif
	 
	 
    ENDPROC	 
	 
	 
	

    PROCEDURE TotalGastosMedicos 
	        SELECT Nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 365;
   			INTO CURSOR informe 
   			
   			IF NOT ISNULL(this.DeduGastosMedicos)
   			  this.DeduGastosMedicos = informe.total
			ELSE
			  this.DeduGastosMedicos =0
			ENDIF
			SELECT informe
            use 
	        IF .NOT. ISNULL(This.DeduGastosMedicos)
	          INSERT INTO repanual(legajo,nombre,cuil,Año,remubruta,clase) VALUES (this.legajo,"GastosMedicos",this.cuil,this.Año,this.DeduGastosMedicos,2) 
	        ENDIF  

	ENDPROC
	
	 
	 
	 
	
	PROCEDURE BUSCONOMBRE
	  
	 SELECT NOMBRE,CUIL FROM PERSONAL WHERE LEGAJO = this.legajo INTO CURSOR existe 
	
	 This.nombre = existe.nombre
	 this.cuil   = existe.cuil
	 return
	ENDPROC 
	 
	PROCEDURE CREOCURSOR

		CREATE CURSOR repanual( legajo n(4), nombre c(40), cuil c(14),Año n(4),remubruta n(10,2),clase n(1))


	ENDPROC 
	 
	 
	PROCEDURE VerificarNul
          
			IF ISNULL(this.DeduGastosMedicos)
               this.DeduGastosMedicos = 0 
			ENDIF 

			IF ISNULL(this.DeduHonorariosMedicos)
				this.DeduHonorariosMedicos =0  
			ENDIF 

			IF ISNULL(this.DeduPrimaSeguroDeVida)
               this.DeduPrimaSeguroDeVida =0  
            ENDIF 

			IF ISNULL(this.DeduDonaciones)
               this.DeduDonaciones =0  
            ENDIF
			
			
			
			
	ENDPROC 
	 
	 
	PROCEDURE GRABAR
	
            if this.SaldoEmpleado <> 0
               Saldo = this.SaldoEmpleado - (this.SaldoEmpleado * 2)
            else
               Saldo = this.SaldoAfip
            endif      

			Select legajo from saldo2017 where legajo = this.legajo into cursor existe
			if eof()
               insert into saldo2017 (legajo,importe) values (this.legajo,Saldo)
            else
               update saldo2017 set importe = saldo where legajo = this.legajo 

            endif      
	                
	        sele existe
	        use  
	
	
	ENDPROC 
	 
	 
	  
	 
	 
	
ENDDEFINE	 