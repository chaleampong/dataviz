*\Plots for Two Continuous Variables 

*\ Scatter plots

sysuse auto, clear

* Basic scatter plots
twoway (scatter price mpg)
tw (sc price mpg)

* Multiple y-variable against one x-variable
twoway (scatter trunk turn mpg price)

* Multiple scatterplots
twoway (scatter price mpg) (scatter price turn)

* Using the by option
twoway (scatter price mpg, by(foreign, compact))

* Square markers
twoway (scatter price mpg, msymbol(S))
twoway (scatter price mpg, msymbol(S) mcolor(edkblue%70))
twoway (scatter price mpg, msymbol(S) mcolor(edkblue%70) msize(*2)) 

* Labelled markers
twoway (scatter price mpg, mlabel(make))

*\ Heat plots \*

webuse nhanes2.dta, clear

ssc install heatplot, replace

* Basic problem
tw (sc weight height)

* Basic heatplot bivariate distribution
heatplot weight height

heatplot weight height, statistic(count)

heatplot weight height, sizeprop

heatplot weight height, levels(5)

heatplot weight height, levels(10) colors(plasma)

heatplot weight height, ybwidth(2) xbwidth(1)

heatplot weight height, scatter

heatplot weight height, hexagon


*\ Sunflower plots

webuse nhanes2.dta, clear

* Basic problem
tw (sc weight height)

sunflower weight height

sunflower weight height, binwidth(5)

*\ Line of Best fit plots
sysuse auto.dta, clear

* The relationship between car price and miles per gallon
tw (scatter price mpg)

* Lines of the best fit
tw (scatter price mpg) (lfit price mpg)

tw (scatter price mpg if foreign == 0) (scatter price mpg if foreign == 1) (lfit price mpg if foreign == 0, lcolor(dknavy)) (lfit price mpg if foreign == 1, lcolor(maroon))

tw (scatter price mpg) (lfit price mpg, by(foreign, total row(1)))

* Quadratic lines of best
tw (scatter price mpg) (qfit price mpg)

* Line fit with confidence intervals
tw (scatter price mpg) (lfitci price mpg)

*\ Line plot (usually time series plot) \*

sysuse uslifeexp, clear

* A basic line plot
line le year

scatter le year, connect(l)

* Two line plots
tw (line le_male year) (line le_female year)

*\ Area Plots

sysuse uslifeexp, clear

* Basic line plot
tw (line le year)
* Basic area plot
tw (area le year)
* Basic bar plot
tw (bar le year)
* Basic spike plot
tw (spike le year)
* Basic dropline plot
tw (dropline le year)

* Area plot with options
tw (area le year, horizontal)
tw (area le year, base(0))
tw (area le year, color(gs8%40))

*\ Range plot

sysuse uslifeexp, clear

* Basic range line plot
tw (rline le_female le_male year)
* Basic range area plot
tw (rarea le_female le_male year)
* Basic range bar plot
tw (rbar le_female le_male year)

*\ Dropline plot

sysuse lifeexp, clear

* Generate log gnp per capita
generate lngnp = ln(gnppc)

* Basic dropline plot for all data
twoway dropline lexp lngnp

* Basic dropline plot for limited data
twoway dropline lexp lngnp if region == 3, mlabel(country) mlabpos(11) mlabsize(*.7)

*\ Rainbow plots
sysuse uslifeexp, clear

* many lines
line le_wfemale le_female le_w le le_wmale le_male le_bfemale le_b le_bmale year

* Install colorpallete
ssc install palettes, replace

* Colorpalette 1
colorpalette Gold FireBrick, n(9)
return list
line le_wfemale le_female le_w le le_wmale le_male le_bfemale le_b le_bmale year, lcolor(`r(p)') legend(off)

