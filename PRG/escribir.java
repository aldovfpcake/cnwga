/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xlm;

/**
 *
 * @author aldo.valente
 */
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
public class escribir {
    
    public void grabar(int hijos){
           xlm datos = new xlm();
           FileWriter flwriter = null;
           try{
               flwriter = new FileWriter("C:\\sueldos\\estudiantes.txt",true);
               BufferedWriter bfwriter = new BufferedWriter(flwriter);
               String S = new String();
               S= "SADASDF";
               System.out.println("hijos:::"+hijos);
               bfwriter.write(xlm.EmpleadoCuil +','+xlm.EmpleadoNombre +','+datos.EmpleadoEsposa +','+hijos + ','+datos.TctaMedico +','+ datos.Tdnaciones + ','+datos.Creditohipo+"\n");
               bfwriter.close();
           }catch(IOException e) {
			e.printStackTrace();
		} finally {
			if (flwriter != null) {
				try {//cierra el flujo principal
					flwriter.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
           
           System.out.println("Grabando a Disco");
           datos.Canthijos = 0;
           datos.TctaMedico=0;
           datos.Tdnaciones=0;
           datos.Creditohipo=0;
           datos.EmpleadoEsposa=0;
    }
    
}
