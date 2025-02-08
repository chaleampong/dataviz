*\ Plots for Two Discrete Variables

*\ Jitter plot

sysuse auto, clear

* Scatter plot with discrete data
tw (scatter foreign rep78)

tw (scatter foreign rep78, jitter(12))

tw (scatter foreign rep78, jitter(12) jitterseed(1234)) 

*\ Table plot

ssc install tabplot

sysuse nlsw88.dta, clear

* One way tabulation
tab occupation
tabplot occupation

* Two way tabulation
tab occupation industry

tabplot occupation industry, ylabel(1(1)13, labsize(small) valuelabel angle(45)) xlabel(1(1)12, labsize(small) valuelabel angle(45))

*\ Ballloon plot

sysuse nlsw88, clear

* Give all observations a weight of 1
gen weight = 1
collapse (sum) weight, by(occupation industry)

* Scatterplot with weights
tw (sc occupation industry [w = weight])

* Scatterplot with weights
tw (sc occupation industry [w = weight], ms(circle) mfc(eltblue%50) msize(*0.5) ylabel(1(1)13, labsize(small) valuelabel angle(45)) xlabel(1(1)12, labsize(small) valuelabel angle(45)) legend(off))


*\ Stacked bar graph
webuse lbw.dta, clear
*\ Create a four-category age variable
gen agecats=1 if inrange(age, 14, 19)
replace agecats=2 if inrange(age, 20, 23)
replace agecats=3 if inrange(age, 24, 26)
replace agecats=4 if inrange(age, 27, 45)

label define agecats 1 "14-19" 2 "20-23" 3 "24-26" 4 "27-45", replace
label values agecats agecats

tab agecats

graph bar, over(agecats) asyvars
graph bar, over(agecats) stack asyvars

graph hbar, over(agecats) stack asyvars
graph hbar, over(agecats) over(race) stack asyvars
graph hbar, over(agecats) over(race) stack asyvars blabel(bar, pos(center) format(%3.0f) size(medium) color(white)) legend(pos(6) row(1) title("Age Group of Mother", size(medsmall) margin(vsmall)




