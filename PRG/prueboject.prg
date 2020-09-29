*PARAMETERS legajo
OPEN DATABASE f:\sueldos\nwga\datos\GANANCIAS.DBC SHARED
SET PROCEDURE TO c:\cnwga\PRG\clanual
SET PATH TO F:\SUELDOS\EMPRE1;c:\cnwga\prg;c:\cnwga\forms
SET EXCLUSIVE OFF
SET DELETED ON
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
*clear
legajo = 724


x = CREATEOBJECT("liquianual",legajo,2019,1)
arch = "c:\SUELDOS\SANMART\"+STR(legajo,4)+" -"+ALLTRIM(x.nombre) + ".txt"


fso = CreateObject('Scripting.FileSystemObject')
tf = fso.CreateTextFile((arch),.t.)
linea = "Declaración Jurada Anual Impuesto A las Ganancias 4 Categoría Año 2019"
?linea
tf.WriteLine(linea)
linea = "---------------------------------------------------------------------"
?linea
tf.WriteLine(linea)

linea = "legajo....................................:" + STR(legajo,4)  
?linea
tf.WriteLine(linea) 
linea = "Nombre....................................:"  + x.nombre
?linea
tf.WriteLine(linea)
linea = " Cuil......................................:"  + x.cuil
?linea
tf.WriteLine(linea)
linea = "  Remuneración Computable.................:"+" "+ STR(x.REMUBRUTA,12,2)
?linea
tf.WriteLine(linea)
linea = "  Remuneración Sujeta A Aportes...........:"+" "+ STR(x.RemuBrutaSujetaAporte,12,2)
?linea
tf.WriteLine(linea)
linea ="  Aportes Obra Social......................:"+" "+ STR(x.DeduObraSocial,8,2)
?linea
tf.WriteLine(linea)
linea ="  Cta Sindical.............................:"+" "+ STR(x.DeduCtaSindical,8,2)
?linea
tf.WriteLine(linea)
linea ="  Aportes Jubilatorios.....................:"+" "+ STR(x.DeduAporteJubilatorio,8,2)
?linea
tf.WriteLine(linea)
linea ="  Ley 19032................................:"+" "+ STR(x.DeduLey19032,8,2)
?linea
tf.WriteLine(linea)
linea ="  Remuneración Neta..........:"+" "+ STR(x.Remuneta,8,2)
?linea
tf.WriteLine(linea)
linea ="  Donaciones...............................:"+" "+ STR(x.DeduDonaciones,8,2)
?linea
tf.WriteLine(linea)
linea ="  Intereses Hipotecarios...................:"+" "+ STR(x.DeduInteresesHipotecarios,8,2)
?linea
tf.WriteLine(linea)
linea ="  Primas Seguro de Vida ...................:"+" "+ STR(x.DeduPrimaSeguroDeVida,8,2)
?linea
tf.WriteLine(linea)
linea ="  Cuota Médico Asistencial.................:"+" "+ STR(x. DeduCtaMedicoAsistencial,8,2)
?linea
tf.WriteLine(linea)
linea ="  Gastos Médicos...........................:"+" "+ STR((IIF(ISNULL(x.DeduGastosMedicos),0,x.DeduGastosMedicos)),8,2)
?linea
tf.WriteLine(linea)
linea ="  Gastos de Sepelio........................:"+" "+ STR(x.DeduGastosSepelio ,8,2)
?linea
tf.WriteLine(linea)
linea ="  Alquileres...............................:"+" "+ STR(x.Dedualquileres ,8,2)
?linea
tf.WriteLine(linea)
linea ="  Total Deducciones .....................:"+ " "+STR(x.TotalDeducciones,8,2)
?linea
tf.WriteLine(linea)
linea ="  "
?linea
tf.WriteLine(linea)
linea = " Totales Artículo 23..................."
?linea
tf.WriteLine(linea)
linea = " Ganancia No Imponible.................:"+" "+ str(x.ArtDeduGananciaNoImpo,8,2)
?linea
tf.WriteLine(linea)
linea = " Deduccion Especial ...................:"+" "+ STR(x.ArtDeduEspecial,8,2)
?linea
tf.WriteLine(linea)
linea = " Cargas de Familia.....................:"+" "+ STR(x.ArtDeduOtrasCargas,8,2)
?linea
tf.WriteLine(linea)
linea = " Conyuge ..............................:"+" "+ STR(x.ArtDeduEsposa,8,2)
?linea
tf.WriteLine(linea)
linea = " Hijo .................................:"+" "+ STR(x.ArtDeduHijo,8,2) 
?linea
tf.WriteLine(linea)
linea = "Total Deducciones Art 23 ..............:"+" "+ STR(x.TotalDeduccionesArt,8,2) 
?linea
tf.WriteLine(linea)
linea = " "
?linea
tf.WriteLine(linea)
linea = "Remuneracion Sujeta A Impuesto.........:"+" "+ STR(x.RemuSujetaAImp,8,2) 
?linea
tf.WriteLine(linea)
linea =" "
linea = "Impuesto Determinado ..................:"+" "+ STR(x.ImpDeterm,8,2)
?linea
tf.WriteLine(linea)
linea = "Impuesto Retenido... ..................:"+" "+ STR(x.ImpRetenido,8,2)
?linea
tf.WriteLine(linea)
linea = "Saldo A Favor Afip.....................:"+" "+ STR(x.SaldoAfip,8,2)
?linea
tf.WriteLine(linea)
linea = "Saldo A Favor Empleado.................:"+" "+ STR(x.SaldoEmpleado,8,2)
?linea
tf.WriteLine(linea)
linea = "   "
?linea
tf.WriteLine(linea)
if x.TopeGastosSepelio = 1
   linea = "Se Aplica Tope Gastos de Sepelio $ 996.23"
   ?linea
   tf.WriteLine(linea)
endif   

if x.TopeInteresesHipotecarios = 1
   linea = "Se Aplica Tope Intereses Hiportecarios $ 20000"
   ?linea
   tf.WriteLine(linea)
endif   

if x.TopeDeduDonaciones = 1 
   linea = "Se Aplica Tope 5% ganancia neta a Donaciones"
   ?linea
   tf.WriteLine(linea)
endif   

if x.TopeGastosMedicos = 1 
   ?linea
   linea = "Se Aplica Tope 5% ganancia neta a Gastos Médicos"
   tf.WriteLine(linea)
endif   
if x.TopeCtaMedicoAsistencial = 1 
   ?linea
   linea = "Se Aplica Tope 5% ganancia neta a Cta Medico Asistencial"
   tf.WriteLine(linea)
endif   
EJECT
?CHR(13)

tf.Close

RELEASE x






return