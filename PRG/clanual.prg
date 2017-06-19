    
DEFINE CLASS liquianual as Custom   
     RemExenta = 0
	 RemuBruta = 0
	 RemuComputable = 0
	 RmuNoAlc = 0
	 ArtDeduEspecial = 0
	 ArtDeduEsposa = 0
	 ArtDeduGananciaNoImpo = 0
	 ArtDeduHijo = 0
	 ArtDeduOtrasCargas = 0
	 DeduAporteJubilatorio = 0
	 DeduCtaMedicoAsistencial = 0
	 DeduCtaSindical = 0
	 DeduDonaciones = 0
	 DeduGastosSepelio = 0
	 DeduLey19032 =0
	 DeduHonorariosMedicos = 0
	 DeduInteresesHipotecarios = 0
	 DeduObraSocial = 0
	 DeduPrimaSeguroDeVida = 0
	 ImpDeterm = 0
	 ImpRetenido = 0
	 PagoACuenta = 0
	 RemuSujetaAImp = 0
	 Saldo = 0
	 TotalDeducciones = 0
	 TotalDeduccionesArt = 0
	 nombre = " "
	 Cuil   = " "
	 
	 legajo =0 
	 Año = 0 
	 Empresa = 0
	 PROCEDURE Init(ParmLegajo,ParmAno,ParmEmpresa)
	   This.Año = ParmAno   
	   This.legajo = Parmlegajo
	   This.Empresa = ParmEmpresa   
	   this.busconombre
	   this.TotalRemubruta  
	   this.TotalObrasocial
	   this.TotalSindical
	   this.TotalJubilatiorios
	   this.TotalMedicoAsistencial
	   this.TotalDeduleyVeinteTreintaydos 
	   this.TotalDonaciones
	   this.TotalIntHipo
	   this.TotalGastosSepelio 
	   this.TotalArt23
	   this.CalcularTotaldeducciones
	   this.CalcularTotalDedu23
	   this.CalculaRemusjta
	   this.CalculaRetencion
	   this.CalculaImporteRetenido
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
             	 
	 ENDPROC    
	 
	 
	PROCEDURE TotalObraSocial 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 120;
   			INTO CURSOR informe 
	 		this.DeduObraSocial = informe.total
			SELECT informe
            use 
	 
	ENDPROC 
	 
	PROCEDURE TotalSindical 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 145;
   			INTO CURSOR informe 
   			this.DeduCtaSindical = informe.total
			SELECT informe
            use 
	 
	ENDPROC  
	
	PROCEDURE TotalJubilatiorios 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 100;
   			INTO CURSOR informe 
   			this.DeduAporteJubilatorio = informe.total
			SELECT informe
            use 
	 
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
   			this.DeduGastosSepelio = informe.total
			SELECT informe
            use 
	 
	ENDPROC
	
	PROCEDURE TotalDeduleyVeinteTreintaydos 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 130;
   			INTO CURSOR informe 
   			this.DeduLey19032 = informe.total
			SELECT informe
            use 
	 
	ENDPROC
	
	PROCEDURE CalculaRetencion
	    SELECT * FROM escala2016 WHERE BETWEEN(this.RemuSujetaAImp,DE,A) INTO CURSOR GESCALA
	    
        Nsaldo = this.RemuSujetaAImp -GESCALA.excedente
        Porc = (Nsaldo*GESCALA.porcentajen/100)
        this.ImpDeterm = Porc + GESCAlA.suma 		
	    select gescala
		use
	    IF this.RemuSujetaAImp > 120000
	        Nsaldo = 0
	        Nsaldo =  this.RemuSujetaAImp - 120000
	        Porc = 0
	        Porc = (Nsaldo*35)/100
	        this.ImpDeterm = Porc+ 28500
	    
	    ENDIF
	    
	    
	
	ENDPROC
	
	
	
	
	
	
	

    PROCEDURE TotalMedicoAsistencial 
			SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 362;
   			INTO CURSOR informe 
   			this.DeduCtaMedicoAsistencial= informe.total
			SELECT informe
            use 
	 
	ENDPROC
    PROCEDURE TotalDonaciones 
			SELECT nlegajo.diciembre as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 363;
   			INTO CURSOR informe 
   			this.DeduDonaciones= informe.total
			SELECT informe
            use 
	 
	ENDPROC

    PROCEDURE TotalIntHipo
            SELECT SUM(Nlegajo.enero+Nlegajo.febrero+ Nlegajo.marzo+ Nlegajo.abril+Nlegajo.mayo+Nlegajo.junio+Nlegajo.julio+Nlegajo.agosto+Nlegajo.setiembre+Nlegajo.octubre+Nlegajo.noviembre+Nlegajo.diciembre) as total;
 			FROM ;
     		ganancias!nlegajo ;
    		INNER JOIN ganancias!nconceptos ;
   			ON  Nlegajo.concepto = Nconceptos.concepto;
 			WHERE  Nlegajo.legajo = this.legajo;
   			AND  Nlegajo.empresa = this.Empresa;
   			AND  Nlegajo.ano = this.Año;
   			AND  Nconceptos.concepto = 360;
   			INTO CURSOR informe 
   			this.DeduInteresesHipotecarios= informe.total
			SELECT informe
            use    

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
    
	
	
	PROCEDURE CALCULARTOTALDEDUCCIONES
	    this.TotalDeducciones = this.DeduAporteJubilatorio + this.DeduCtaMedicoAsistencial+ this.DeduCtaSindical +this.DeduDonaciones + this.DeduGastosSepelio + this.DeduHonorariosMedicos + this.DeduInteresesHipotecarios + this.DeduObraSocial;
	                        	+ this.DeduPrimaSeguroDeVida + this.DeduLey19032
		
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
   			AND  Nconceptos.concepto = 600;
   			INTO CURSOR informe 
   			this.ImpRetenido= informe.total
			SELECT informe
            use    
	 
	 
	 
	ENDPROC 
	 
	
	PROCEDURE BUSCONOMBRE
	  
	 SELECT NOMBRE,CUIL FROM PERSONAL WHERE LEGAJO = this.legajo INTO CURSOR existe 
	
	 This.nombre = existe.nombre
	 this.cuil   = existe.cuil
	 return
	ENDPROC 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
ENDDEFINE	 