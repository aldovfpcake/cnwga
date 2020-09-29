SET EXCLUSIVE OFF
VVARCHI = " "
DO WHILE EMPTY(VVARCHI)
   VVARCHI = INPUTBOX("Ingrese legajo)","Ingrese",VVARCHI,5600)
ENDDO

Varlegajo = VAL(VVARCHI)





USE nlegajo AGAIN
replace enero     WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace febrero   WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace marzo	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace abril	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace mayo	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace junio	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace julio	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace agosto	  WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace setiembre WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace octubre   WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace noviembre WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018
replace diciembre WITH -5576.49 FOR legajo = Varlegajo .and. empresa = 1 .and. ano = 2018