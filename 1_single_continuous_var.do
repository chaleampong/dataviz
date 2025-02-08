*\ Histogram \* 
* Load auto data

sysuse nlsw88, clear


* Histogram of wage
histogram wage
* Histogram of wage with 10 and 50 bin
   
histogram wage, bin(50)
* Histogram of wage with discrete bins
histogram wage, discrete
* Histogram of wage with bins of width 10
histogram wage, width(10)
* Histogram of wage changing y-axis definition
histogram wage, freq
histogram wage, percent
* Histogram of wage changing y-axis with height labels
histogram wage, percent addlabels

* Equal probability histogram
ssc install eqprhistogram
eqprhistogram wage, bin(5)

*\ Density plot \*
* Load city temp data

sysuse citytemp.dta, clear

* Standard density plot
twoway (kdensity tempjan)

* Density plot with recast area
twoway (kdensity tempjan, recast(area))

* Density plot with recast area and different bandwidths
twoway (kdensity tempjan, recast(area) bw(10))
twoway (kdensity tempjan, recast(area) bw(1))

* Density plot with recast area and different kernels
twoway (kdensity tempjan, recast(area) bw(1) kernel(rectangle))
twoway (kdensity tempjan, recast(area) bw(1) kernel(gaussian))

* Two densities
twoway (kdensity tempjan, recast(area) bw(1)) (kdensity tempjuly, recast(area) bw(1))
twoway (kdensity tempjan, recast(area) bw(1) fc(%50)) (kdensity tempjuly, recast(area) bw(1) fc(%50))

* Many densities
twoway (kdensity tempjan if region == 1, col(black) fc(ltblue%50) title(Kernel Density Plot of Temperature) recast(area)) ///
(kdensity tempjan if region == 2, col(black) fc(erose%50) title(Kernel Density Plot of Temperature) recast(area)) ///
(kdensity tempjan if region == 3, col(black) fc(emerald%50) title(Kernel Density Plot of Temperature) recast(area)) ///
(kdensity tempjan if region == 4, col(black) fc(sand%50) title(Kernel Density Plot of Temperature) recast(area)) 

twoway ///
  (kdensity tempjan if region == 1, col(black) fc(ltblue%50) recast(area)) ///
  (kdensity tempjan if region == 2, col(black) fc(erose%50) recast(area)) ///
  (kdensity tempjan if region == 3, col(black) fc(emerald%50) recast(area)) ///
  (kdensity tempjan if region == 4, col(black) fc(sand%50) recast(area)), ///
  title("Kernel Density Plot of Temperature") ///
  legend(order(1 "NE" 2 "N Cntrl" 3 "South" 4 "West"))
  
*\Cumulative Density plots\*

*load city data

*install displot
ssc install distplot

* Cumulative density
distplot tempjan
* Cumulative density with area shading
distplot tempjan, recast(area) fc(%50)
* Cumulative density with area shading reverse option
distplot tempjan, recast(area) fc(%50) reverse
* Cumulative density with spike
distplot tempjan, recast(spike)

* Multiple cumulative density plots
distplot tempjan tempjuly
* Multiple cumulative density plots with over option
distplot tempjan, over(region)
* Multiple cumulative density plots
distplot tempjan tempjuly, by(region)


*\Spike plots\*

sysuse citytemp.dta, clear

* Histogram with many bins
histogram tempjan, bin(200) lc(black) lw(vvthin)

* Spike plot
spikeplot tempjan
* Spike plot with different bin width
spikeplot tempjan, round(1) 
spikeplot tempjan, fraction

* Multiple spikeplot
twoway (histogram tempjan, bin(200) lc(black%40) lw(vvthin) fc(eltblue%40)) (histogram tempjuly, bin(200) lc(black%40) lw(vvthin) fc(erose%40)) 

*\Boxplot\*

sysuse citytemp.dta, clear

*Basic boxplot
graph box tempjan
*Basic boxplot with outliers
graph box tempjan if region == 1
*Multiple boxplots
graph box tempjan tempjuly
*Horizontal boxplots
graph hbox tempjan tempjuly
*Horizontal boxplots over regions
graph hbox tempjan tempjuly, over(region)
* Ordering boxes
graph hbox tempjan, over(division, sort(1))

* Install histbox
ssc install histbox, replace

histbox tempjan, mean

*\Violin plot\*
sysuse citytemp.dta, clear

*Install vioplot
ssc install vioplot

* A violin plot\*
vioplot tempjan

* Multiple violin plots
vioplot tempjan tempjuly, over(division)
vioplot tempjan tempjuly, over(division) horizontal
vioplot tempjan tempjuly, over(division) horizontal obs

*\Dot plot\*

sysuse citytemp.dta, clear

* Dotplot
dotplot tempjan

dotplot tempjan tempjuly

dotplot tempjuly, over(division)
dotplot tempjuly, over(division) mean

*\Quantile plot\*

sysuse citytemp, clear

*symmetry plot
symplot tempjan

*quantile-normal plot
qnorm tempjan

* QQ plot
qqplot tempjan tempjuly


