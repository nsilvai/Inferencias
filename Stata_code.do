
use "C:\Users\Usuario\Desktop\Casen 2017.dta", clear
***MANTENER EN BASE DE DATOS SOLAMENTE A LOS MAYORES DE 18 AÑOS***
keep if edad>=18 & edad!=.
***CREAR VARIABLE CATEGÓRICA CON EL APOYO AL PRESIDENTE BORIC POR REGIÓN EN LA ELECCIÓN PRESIDENCIAL DE 2021***
g apoyo_b=.
replace apoyo_b=1 if region==9
replace apoyo_b=2 if region==1 | region==7 | region==8 | region==16
replace apoyo_b=3 if region==2 | region==3 | region==4 | region==5 | region==6 | region==10 | region==11 | region==14 | region==15
replace apoyo_b=4 if region==12 | region==13
label define apoyo_b 1 "<40%" 2 "40%-50%" 3 "50%-60%" 4 ">60"
label values apoyo_b apoyo_b
keep apoyo_b folio
g sample=0

***GUARDAR BASE DE DATOS COMO "SIM 0"***
cd "C:\Users\Usuario\Desktop\SIM\"
save sim0.dta, replace


***ESTE CÓDIGO GENERA 500 MUESTRAS, SELECCIONADAS POR MUESTREO ALEATORIO SIMPLE CON RESPOSICIÓN, Y GUARDA CADA MUESTRA EN UN ARCHIVO INDEPENDIENTE***
forvalues j = 1/500 {
use "C:\Users\Usuario\Desktop\Casen 2017.dta", clear
keep if edad>=18 & edad!=.
g apoyo_b=.
replace apoyo_b=1 if region==9
replace apoyo_b=2 if region==1 | region==7 | region==8 | region==16
replace apoyo_b=3 if region==2 | region==3 | region==4 | region==5 | region==6 | region==10 | region==11 | region==14 | region==15
replace apoyo_b=4 if region==12 | region==13
label define apoyo_b 1 "<40%" 2 "40%-50%" 3 "50%-60%" 4 ">60"
label values apoyo_b apoyo_b
sample 100, count
keep apoyo_b folio
g sample=`j'
cd "C:\Users\Usuario\Desktop\SIM\"
save sim`j'.dta, replace
}

cd "C:\Users\Usuario\Desktop\SIM"
use sim0.dta, clear


***ESTE CÓDIGO GENERA UNA BASE DE DATOS CON LAS 500 MUESTRAS, MÁS LA BASE DE DATOS ORIGINAL (SIM 0)***
forvalues j = 1/500 {
cd "C:\Users\Usuario\Desktop\SIM\"
append using sim`j-1'.dta
}
