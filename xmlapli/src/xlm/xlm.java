package xlm;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;

/**
 *
 * @author aldo.valente
 */
public class xlm {
    private static File FXmlFile;
    public static int Canthijos=0;
    public static float TctaMedico =0; 
    public static float Tdnaciones =0;
    public static float Creditohipo=0;
    public static float TotSeguroDeVida =0; 
    public static float TotAlquileres =0;
    public static float TotGastosmedicos =0;
    public static float TotSeguroRetiro =0;
    public  static int EmpleadoEsposa=0; 
    public static String EmpleadoNombre = " ";
    public static String EmpleadoCuil = " ";
    public static String Hijastroc = " ";
    public static String FechaPresenta = " ";
    public static  String Snom;
     public static float TotDolar =0;
    
    
    
    
    public static void main(String argv[]) {
    String sDirectorio = "C:\\siradig-2021\\";
    File f = new File(sDirectorio);
    String RutaArch;    
    RutaArch = "C:\\siradig-2021\\";
    String Arch; 
    File[] ficheros = f.listFiles();
          for (int x=0;x<ficheros.length;x++){
          System.out.println( RutaArch +ficheros[x].getName());
         
          Arch =  RutaArch+ficheros[x].getName();           
        
        
        try {
       
	FXmlFile = new File( Arch);
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(FXmlFile);
         
        CargaEmpleado();
	//optional, but recommended
	//read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
	doc.getDocumentElement().normalize();

	System.out.println("Root element nombre :" + doc.getDocumentElement().getNodeName());
        
        NodeList nList = doc.getElementsByTagName("deduccion");

	System.out.println("----------------------------");
        
	for (int temp = 0; temp < nList.getLength(); temp++) {

		Node nNode = nList.item(temp);

		System.out.println("\nCurrent Element :" + nNode.getNodeName());

		if (nNode.getNodeType() == Node.ELEMENT_NODE) {

			Element eElement = (Element) nNode;
                        String CtaMedico,Donaciones,StrCreditohipo,StrSeguroDeVida,StrAlquileres,StrGastosmedicos;
                        String StrTotSegRetiro;
                        
                        CtaMedico = "1";
                        Donaciones = "3";
                        StrCreditohipo = "4";
                        StrSeguroDeVida = "2";
                        StrAlquileres = "22";
                        StrGastosmedicos = "7";
                        StrTotSegRetiro= "24";
                        String Elem = new String();
                        String Cta  = new String();
                        
                        Elem = eElement.getAttribute("tipo");
                        if(CtaMedico.equalsIgnoreCase(Elem))
                        {
                         Cta =  eElement.getElementsByTagName("montoTotal").item(0).getTextContent();   
                        System.out.println("cta medico : " + Cta) ;
                        TctaMedico = TctaMedico + Float.parseFloat(Cta);
                         
                        }
                        if(StrGastosmedicos.equalsIgnoreCase(Elem))
                        {
                         Cta =  eElement.getElementsByTagName("montoTotal").item(0).getTextContent();   
                        System.out.println("Gastos Medicos tipo 7: " + Cta) ;
                         Snom = "verifica gastos medicos";
                        TotGastosmedicos  =  TotGastosmedicos + Float.parseFloat(Cta);
                         
                        }
                        if(StrTotSegRetiro.equalsIgnoreCase(Elem))
                        {
                         Cta =  eElement.getElementsByTagName("montoTotal").item(0).getTextContent();   
                         System.out.println("Seguro de Retiro: " + Cta) ;
                         TotSeguroRetiro  = TotSeguroRetiro + Float.parseFloat(Cta);
                         
                        }
                        
                        
                        
                        
                        if(StrSeguroDeVida.equalsIgnoreCase(Elem))
                           {     
                            Cta =  eElement.getElementsByTagName("montoTotal").item(0).getTextContent();
                            TotSeguroDeVida = Float.parseFloat(Cta);
                           }   
                        
                        if(StrAlquileres.equalsIgnoreCase(Elem))
                          { 
                            Cta =  eElement.getElementsByTagName("montoTotal").item(0).getTextContent();
                            TotAlquileres = Float.parseFloat(Cta);
                          } 
                        //Elem = eElement.getAttribute("tipo");
                        String Donac = new String();
                        if(Donaciones.equalsIgnoreCase(Elem))
                        {
                            Donac = eElement.getElementsByTagName("montoTotal").item(0).getTextContent(); 
                            Tdnaciones = Tdnaciones + Float.parseFloat(Donac);
                        } 

                        String Credihip= new String();
                        
                        if(StrCreditohipo.equalsIgnoreCase(Elem))
                        {
                           Credihip = eElement.getElementsByTagName("montoTotal").item(0).getTextContent();
                           Creditohipo= Float.parseFloat(Credihip);
                        
                        }
			System.out.println("tipodoc : " + eElement.getAttribute("tipo"));
			
                        /*System.out.println("First Name : " + eElement.getElementsByTagName).item(0).getTextContent());*/
                        System.out.println("Monto Total : " + eElement.getElementsByTagName("montoTotal").item(0).getTextContent());
			
		}
	}
    
        NodeList nLista = doc.getElementsByTagName("cargaFamilia");
           
        for (int temp = 0; temp < nLista.getLength(); temp++){
            Node xNode = nLista.item(temp);
            System.out.println("\n Elementos :" + xNode.getNodeName());
            if (xNode.getNodeType() == xNode.ELEMENT_NODE){
                	Element eElementos = (Element) xNode;
                        String TipoDoc,TipoEsposa,Parentesco,Hijo,HijoDiscapacitado,Hijastro;
                        TipoDoc    ="86";
                        TipoEsposa ="80";
                        Parentesco = "1";
                        Hijo = "3";
                        HijoDiscapacitado ="31";
                        Hijastro = "30";
                        
                        if(HijoDiscapacitado.equals(eElementos.getElementsByTagName("parentesco").item(0).getTextContent()))
                        {
                        System.out.println("Tipo Doc : " + eElementos.getElementsByTagName("tipoDoc").item(0).getTextContent());
                        Canthijos= Canthijos +1; 
                        }
                        if(Hijastro.equals(eElementos.getElementsByTagName("parentesco").item(0).getTextContent()))
                        {
                        System.out.println("Tipo Doc  hijastro: " + eElementos.getElementsByTagName("tipoDoc").item(0).getTextContent());
                        Canthijos= Canthijos +1; 
                        Hijastroc = "Verficar";
                        }
                        
                        if(Hijo.equals(eElementos.getElementsByTagName("parentesco").item(0).getTextContent()))
                        {
                        System.out.println("Tipo Doc : " + eElementos.getElementsByTagName("tipoDoc").item(0).getTextContent());
                        Canthijos= Canthijos +1; 
                        }
                 
                        if(Parentesco.equals(eElementos.getElementsByTagName("parentesco").item(0).getTextContent())) 
                          {
                           System.out.println("Esposa : " + eElementos.getElementsByTagName("parentesco").item(0).getTextContent());   
                           EmpleadoEsposa = 1; 
                          }   
            
            
            
            }
         
        }
    
        NodeList nReter =  doc.getElementsByTagName("retPerPago");
          for (int temp = 0; temp < nReter.getLength(); temp++){
          
             Node zNode = nReter.item(temp);
            
             System.out.println("\n Retencion Dolar :" + zNode.getNodeName());
             if (zNode.getNodeType() == zNode.ELEMENT_NODE){
                Element eElementa = (Element) zNode;
                System.out.println("Dolares Doc : " + eElementa.getElementsByTagName("tipoDoc").item(0).getTextContent());
                String CtaDolar = new String();
                CtaDolar = eElementa.getElementsByTagName("montoTotal").item(0).getTextContent();
                System.out.println("Total Dolares :" + CtaDolar);
                TotDolar  = TotDolar+ Float.parseFloat(CtaDolar);
              
              
              
              
              
              
              }
        
        
          }
        
        
        
        
        
    } catch (Exception e) {
	e.printStackTrace();
    }
    System.out.println("Cantidad de Hijos....:"+Canthijos);
    System.out.println("Importe ="+ Float.toString( Canthijos*2036));
    System.out.println("----------------");
    System.out.println("Esposa  ="+EmpleadoEsposa+ " Importe="  + Float.toString(EmpleadoEsposa*4037));
    CargaFamilia();
      escritura();
          }
    }

      
    
    
    
private static void CargaFamilia(){
    System.out.println("Cargas de Familia" + Canthijos);
}

private static void CargaEmpleado(){
    try
      {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc = dBuilder.parse(FXmlFile);
        doc.getDocumentElement().normalize();
        System.out.println("Datos Del Empleado");    
	System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
        System.out.println("Fecha de Presentacion :"+ doc.getElementsByTagName("fechaPresentacion").item(0).getTextContent());
        FechaPresenta = doc.getElementsByTagName("fechaPresentacion").item(0).getTextContent();
        NodeList nList = doc.getElementsByTagName("empleado");
        for (int temp = 0; temp < nList.getLength(); temp++) {

		Node nNode = nList.item(temp);

		System.out.println("\nCurrent Element :" + nNode.getNodeName());

		if (nNode.getNodeType() == Node.ELEMENT_NODE) {

			Element eElement = (Element) nNode;

			System.out.println("Apellido  : " +  eElement.getElementsByTagName("apellido").item(0).getTextContent());
                        System.out.println("Cuit      : " +  eElement.getElementsByTagName("cuit").item(0).getTextContent());
                        EmpleadoNombre = eElement.getElementsByTagName("apellido").item(0).getTextContent();
			EmpleadoCuil = eElement.getElementsByTagName("cuit").item(0).getTextContent();
                        
		}
      
      
      
      }
      
      }
        catch (Exception e){
        e.printStackTrace();
    }
     
   
}

         
 private static void escritura(){
   escribir es = new escribir();
   int hc = Canthijos;
   System.out.println("--------->"+Canthijos);
   es.grabar(hc);
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 


} 
    
    

