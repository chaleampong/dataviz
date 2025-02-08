*\ Three or more variables

*\ Contour plots

sysuse sandstone, clear

* Basic contour plot
tw (contour depth northing easting)

* Basic contourline plot
tw (contourline depth northing easting)

tw (contour depth northing easting, levels(10))


*\ Bubble plots

sysuse census, clear

* Basic scatter plot

tw (scatter medage death) (qfit medage death)

* Basic bubble plots
tw (scatter medage death if region == 1 [fweight = pop], mcolor(red) msymbol(O)) (scatter medage death if region == 2 [fweight = pop], mcolor(blue) msymbol(D)) (scatter medage death if region == 3 [fweight = pop], mcolor(green) msymbol(S)) (scatter medage death if region == 4 [fweight = pop], mcolor(orange) msymbol(T)) (qfit medage death [fweight = pop]) , legend(position(6) row(1) order(1 "NE" 2 "N Cntrl" 3 "South" 4 "West" 5 "Fit"))
