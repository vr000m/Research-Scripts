name=system("echo ns-tmmbr-r-competition-503ms") 
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

set terminal pdf color enhanced rounded size 12,6 fsize 20
set output name."-".time.".pdf"


set origin 0,0
set size ratio 0.5
set key horiz 

set key right bottom inside
#unset key
set pointsize 2.5

set xlabel "Time [s]" font "Times, 24"
set ylabel "Throughput [kbps]" font "Times, 24"


set xrange [0:900]
set yrange [0:5100]
set grid  #linetype 1 linewidth 0.500,  linetype -1 linewidth 0.500
#set style fill pattern 5

plot "cr50ms/output.txt" using 1:($2/1000) title 'TMMBR-1' with linespoints lw 5 lt -1 pi 30 pt 6 lc 0, \
"" using 1:(($2+$8)/1000+($14+$16+$18+$20+$22+$24+$26+$28+$30+$32)/1000):(($2+$8)/1000)  with filledcu title 'TCP rate' lc 3, \
"" using 1:(($2+$8)/1000) title 'TMBBR-2' with linespoints lw 5 lt -1 pi 30 pt 5 lc -1