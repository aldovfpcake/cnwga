
DEFINE CLASS datos as Custom
      Legajo = 0
      Ano    = 0
      
      PROCEDURE Init 
      PARAMETERS PLegajo,Pano
      
       this.Legajo = PLegajo
       this.Ano    = Pano
      
      
      Endproc
      


		FUNCTION RemuTotalAnual
		       VarTotAnual = 0
		       VarTtalSap =  0
		       SELECT SUM(n.enero + n.febrero + n.marzo + n.abril+n.mayo+n.junio+n.julio+n.agosto+n.setiembre+n.octubre+n.noviembre+n.diciembre)as tot ;
		       FROM nlegajo n INNER JOIN nconceptos c ON n.concepto = c.concepto WHERE  n.legajo = this.legajo .and. c.clase = 1 .and. ano = this.ano;
		       INTO CURSOR Rtotal
		       VarTotAnual = Rtotal.tot
		       SELECT Rtotal
		       use
		       SELECT SUM(n.enero + n.febrero + n.marzo + n.abril+n.mayo+n.junio+n.julio+n.agosto+n.setiembre+n.octubre+n.noviembre+n.diciembre)as tot ;
		       FROM nlegajo n INNER JOIN nconceptos c ON n.concepto = c.concepto WHERE  n.legajo = this.legajo .and. c.clase = 8 .and. ano = this.ano;
		       INTO CURSOR Sap
		       VarTtalSap = Sap.tot 
		       SELECT Sap
		       use
		      
		RETURN VarTotAnual + VarTtalsap


        FUNCTION ObraSocTotal
        		VarTotObraSoc = 0
                SELECT SUM(n.enero + n.febrero + n.marzo + n.abril+n.mayo+n.junio+n.julio+n.agosto+n.setiembre+n.octubre+n.noviembre+n.diciembre)as tot ;
		        FROM nlegajo n INNER JOIN nconceptos c ON n.concepto = c.concepto WHERE  n.legajo = this.legajo .and. n.concepto = 120 .and. ano = this.ano;
                INTO CURSOR Tob 
                VarTotObraSoc = Tob.tot
                SELECT tob
                use
        
        
        
        RETURN   VarTotObrasoc
        

        FUNCTION JubiTotal
       			VarTotJubi = 0		
                SELECT SUM(n.enero + n.febrero + n.marzo + n.abril+n.mayo+n.junio+n.julio+n.agosto+n.setiembre+n.octubre+n.noviembre+n.diciembre)as tot ;
		        FROM nlegajo n INNER JOIN nconceptos c ON n.concepto = c.concepto WHERE  n.legajo = this.legajo .and. n.concepto = 100 .and. ano = this.ano;
                INTO CURSOR Tju 
                VarTotJubi = Tju.tot
                SELECT tju
                use
       
        RETURN  VarTotJubi






ENDDEFINE