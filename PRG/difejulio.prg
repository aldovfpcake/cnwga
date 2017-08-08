*OPEN DATABASE f:\sueldos\nwga\datos\ganancias SHARED
*SET EXCLUSIVE OFF
*SELECT legajo,DIFE() AS dife FROM nlegajo WHERE concepto = 600 .or. concepto =605 .and. ano = 2017   ORDER BY legajo
***************
*FUNCTION dife
*************
** dda = 0
* dss = 0
*IF concepto =600
*   dd = junio
*ENDIF

*IF concepto = 605
*   dss = junio
*ENDIF

*ETURN dda-dss   


