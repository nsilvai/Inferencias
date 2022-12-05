
use "C:\Users\Usuario\Desktop\Casen 2017.dta", clear
keep if edad>=18 & edad!=.
g apoyo_b=.
replace apoyo_b=1 if region==9
replace apoyo_b=2 if region==1 | region==7 | region==8 | region==16
replace apoyo_b=3 if region==2 | region==3 | region==4 | region==5 | region==6 | region==10 | region==11 | region==14 | region==15
replace apoyo_b=4 if region==12 | region==13
label define apoyo_b 1 "<40%" 2 "40%-50%" 3 "50%-60%" 4 ">60"
label values apoyo_b apoyo_b
keep apoyo_b folio
g sample=0
cd "C:\Users\Usuario\Desktop\SIM\"
save sim0.dta, replace

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

forvalues j = 1/500 {
cd "C:\Users\Usuario\Desktop\SIM\"
append using sim`j-1'.dta
}

0: 7, 26, 44, 22 (33,66)
114: 4, 38, 40, 18 (42,58)
195: 7, 36, 33, 24 (43,57)
220: 13, 31,34,22 (41,56)
 









use "C:\Users\Usuario\Desktop\Casen 2017.dta", clear
g apoyo_b=.
replace apoyo_b=1 if sexo==1 & edad>=18 & edad<65 & qaut<=4
replace apoyo_b=2 if sexo==2 & edad>=18 & edad<65 & qaut<=4
replace apoyo_b=3 if sexo==1 & edad>=65 & edad!=. & qaut<=4
replace apoyo_b=4 if sexo==2 & edad>=65 & edad!=. & qaut<=4
replace apoyo_b=5 if sexo==1 & edad>=18 & edad<65 & qaut==5
replace apoyo_b=6 if sexo==2 & edad>=18 & edad<65 & qaut==5
replace apoyo_b=7 if sexo==1 & edad>=65 & edad!=. & qaut==5
replace apoyo_b=8 if sexo==2 & edad>=65 & edad!=. & qaut==5
label define apoyo_b 1 "Hombre, 18-64, quintil 1-3" 2 "Mujer, 18-64, quintil 1-3" 3 "Hombre, >65, quintil 1-3" 4 "Mujer, >65, quintil 1-3" 5 "Hombre, 18-64, quintil 4 o 5" 6 "Mujer, 18-64, quintil 4 o 5" 7 "Hombre, >65, quintil 4 o 5" 8 "Mujer, >65, quintil 4 o 5"
label values apoyo_b apoyo_b

sample 100, count
keep apoyo_b folio
