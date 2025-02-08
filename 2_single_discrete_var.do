*\Bar graph\*

sysuse nlsw88.dta, clear

* Simple bar graph
graph bar (count)
* Simple bar graph with over option
graph bar (count), over(race)
* Simple bar graph with totals
graph bar (count), over(race) blabel(total)
* Simple bar graph with percent
graph bar (percent), over(race) ylabel(0(20)100)
* Simple horizontal bar graph with percent
graph hbar (percent), over(occupation)
graph hbar (percent), over(occupation, sort(1) descending) missing allcategories 

* Horizontal bar graph over two categaries
graph hbar (count), over(occupation) over(union)
graph hbar (count), over(union) over(occupation) 
graph hbar (count), over(union) over(occupation) asyvars

graph hbar (mean) wage hours, over(occupation, label(labsize(vsmall))) over(union, label(labsize(vsmall)))

*\Pie charts

sysuse census.dta, clear

* Pie chart different mode
graph pie poplt5 pop5_17 pop18p

graph pie death, over(region) plabel(_all percent)

graph pie, over(region)

* Labelling pies
graph pie, over(region) plabel(_all percent)
graph pie, over(region) plabel(_all sum)
graph pie, over(region) plabel(_all percent)

* Exploding pies
graph pie, over(region) plabel(_all name) pie(3, explode)

graph pie, over(region) plabel(_all name) pie(3, explode(20))

* Sorting pies
graph pie, over(region) plabel(_all name) sort

* Multiple pies
graph pie poplt5 pop5_17 pop18p, by(region) plabel(_all percent)

*\Dot charts\*

sysuse nlsw88.dta, clear

* Dot chart
graph dot (count)

* Dot chart over occupation
graph dot (count), over(occupation)

* Dot chart with percent over occupation
graph dot (percent), over(occupation)

* Dot chart with extra categories
graph dot (percent), over(occupation) missing allcategories

* Dot chart with sorting
graph dot (percent), over(occupation, sort(1) descending) missing allcategories

* Dot chart over two categories
graph dot (percent), over(occupation) over(union)
graph dot (percent), over(union) over(occupation) 
graph dot (percent), over(union) over(occupation, sort(1) descending) asyvars

* Dot chart over three categories with summary statistics 
graph dot (mean) wage, over(race) over(occupation) over(union) asyvars

graph dot (mean) wage, over(race) over(union) over(occupation) asyvars
*\ Radar or spider plot\*

sysuse auto.dta, clear

* Install radar command
ssc install radar, replace

* Radar plot
radar make weight in 1/12

radar make weight in 1/12, aspect(1)

radar make weight in 1/12, aspect(1) rlabel(0 500 1000 1500 2000 3000 3500)


* Radar plot with multiple variable
radar make turn mpg trunk if foreign == 1, aspect(1)