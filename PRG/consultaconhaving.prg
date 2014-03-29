select legajo,sum(aporte) AS APORTE, sum(aporte)*0.11 as ju,sum(iif(CONCEPTO=80 .OR. CONCEPTO = 131,descuento,0)) AS DJ from 62009 where liquida = 4 group by legajo
