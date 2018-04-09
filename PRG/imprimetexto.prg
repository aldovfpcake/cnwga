declare integer GetDesktopWindow IN win32api
Declare long ShellExecute in shell32.dll ;
		  long hwnd, ;
		  string lpszOp, ;
		  string lpszFile, ;
		  string lpszParams, ;
		  string lpszDir, ;
		  long nShowCmd
			  
	local pdfFile, printerName 
	&&pdfFile = 'd:\tmp\0xx.pdf'
	pdfFile = 'C:\suerut\listados\rp\372 -CEJAS OMAR TEODORO.txt'	
	printerName = 'RICOH Aficio MP 3350 PCL 5e'
	&& printerName = 'Bullzip PDF Printer'
	
	
	
	?ShellExecute(GetDesktopWindow(), 'printto', m.pdfFile, '"' + m.printerName + '"', null, 7)