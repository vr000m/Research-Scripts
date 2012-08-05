name=system("echo ns-var-50ms") 
#set term canvas
#set output name.".html"
time=system("date +%Y_%m_%d_%H_%M_%S")


#set terminal pdf {monochrome|color|colour}
#                      {{no}enhanced}
#                      {fname "<font>"} {fsize <fontsize>}
#                      {font "<fontname>{,<fontsize>}"}
#                      {linewidth <lw>} {rounded|butt}
#                      {solid|dashed} {dl <dashlength>}}
#                      {size <XX>{unit},<YY>{unit}}
#

set terminal pdf color enhanced rounded size 12,4 fsize 20
set output name."-".time.".pdf"


set origin 0,0
set size ratio 0.25
set key right top inside
set pointsize 2.5

set xlabel "Time [s]"
set ylabel "Sending rate [kbps]"
set xrange [0:900]
set yrange [0:400]
set grid  #linetype 1 linewidth 0.500,  linetype -1 linewidth 0.500
set style fill pattern 5 

plot "sending_rates-50ms.txt" using 1:($6/1000) title 'Link capacity' with lines linecolor rgb "red" linewidth 5 lt 1, \
 "" using 1:($2/1000) title 'TMMBR 50ms'  with linespoints lw 2 lt -1 pi 30 pt 6 ps 1.5 lc -1
