
*PARAMETERS vvleg
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\PRG\clanual
SET PATH TO F:\SUELDOS\EMPRE1;c:\cnwga\prg;c:\cnwga\forms
* e:\nwga\prg\crypta
*x = NEWOBJECT("encri")
*x.legajo = vvleg
*x.empresa = 1
* LOCAL streamco as String
*  streamco = encri("Aldo")
*  desencrip(streamco)

*x.ano = 2010
*x.codigo = 600
*x.agregar
clear
legajo = 419
PUBLIC x

x = CREATEOBJECT("liquianual",legajo,2016,1)

CREATE CURSOR repanual( legajo n(4), nombre c(40), cuil c(14))
INSERT INTO repanual(legajo,nombre,cuil) VALUES (x.legajo,x.nombre,x.cuil)

REPORT FORM declaraanual preview
fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile('c:\testfile.txt', .t.)
linea = "legajo....................................:" + STR(legajo,4)  
tf.WriteLine(linea) 
linea = "Nombre....................................:"  + x.nombre
tf.WriteLine(linea)
linea = "  Remuneración Computable.................:"+" "+ STR(x.REMUBRUTA,8,2)
tf.WriteLine(linea)
linea ="  Aportes Obra Social......................:"+" "+ STR(x.DeduObraSocial,8,2)
tf.WriteLine(linea)
linea ="  Cta Sindical.............................:"+" "+ STR(x.DeduCtaSindical,8,2)
tf.WriteLine(linea)
linea ="  Aportes Jubilatorios.....................:"+" "+ STR(x.DeduAporteJubilatorio,8,2)
tf.WriteLine(linea)
linea ="  Ley 19032................................:"+" "+ STR(x.DeduLey19032,8,2)
tf.WriteLine(linea)
linea ="  Donaciones...............................:"+" "+ STR(x.DeduDonaciones,8,2)
tf.WriteLine(linea)
linea ="  Intereses Hipotecarios...................:"+" "+ STR(x.DeduInteresesHipotecarios,8,2)
tf.WriteLine(linea)
linea ="  Primas Seguro de Vida ...................:"+" "+ STR(x.DeduPrimaSeguroDeVida,8,2)
tf.WriteLine(linea)
linea ="  Cuota Médico Asistencial.................:"+" "+ STR(x. DeduCtaMedicoAsistencial,8,2)
tf.WriteLine(linea)
linea ="  Gastos de Sepelio........................:"+" "+ STR(x.DeduGastosSepelio ,8,2)
tf.WriteLine(linea)
linea ="  Total Deducciones .....................:"+ " "+STR(x.TotalDeducciones,8,2)
tf.WriteLine(linea)
linea ="  "
tf.WriteLine(linea)
linea = " Totales Artículo 23..................."
tf.WriteLine(linea)
linea = " Ganancia No Imponible.................:"+" "+ str(x.ArtDeduGananciaNoImpo,8,2)
tf.WriteLine(linea)
linea = " Deduccion Especial ...................:"+" "+ STR(x.ArtDeduEspecial,8,2)
tf.WriteLine(linea)
linea = " Cargas de Familia.....................:"+" "+ STR(x.ArtDeduOtrasCargas,8,2)
tf.WriteLine(linea)
linea = " Conyuge ..............................:"+" "+ STR(x.ArtDeduEsposa,8,2)
tf.WriteLine(linea)
linea = " Hijo .................................:"+" "+ STR(x.ArtDeduHijo,8,2) 
tf.WriteLine(linea)
linea = "Total Deducciones Art 23 ..............:"+" "+ STR(x.TotalDeduccionesArt,8,2) 
tf.WriteLine(linea)
linea = " "
tf.WriteLine(linea)
linea = "Remuneracion Sujeta A Impuesto.........:"+" "+ STR(x.RemuSujetaAImp,8,2) 
tf.WriteLine(linea)
linea = "Impuesto Determinado ..................:"+" "+ STR(x.ImpDeterm,8,2)
tf.WriteLine(linea)
linea = "Impuesto Retenido... ..................:"+" "+ STR(x.ImpRetenido,8,2)
tf.WriteLine(linea)




tf.Close

*MODIFY FILE 'c:\testfile.txt'





return