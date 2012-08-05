fname="fig-graph-rc-schemes"
#set term canvas
#set output fname.".html"
time=system("date +%Y_%m_%d_%H_%M_%S")


#set terminal pdf {monochrome|color|colour}
#                      {{no}enhanced}
#                      {fname "<font>"} {fsize <fontsize>}
#                      {font "<fontname>{,<fontsize>}"}
#                      {linewidth <lw>} {rounded|butt}
#                      {solid|dashed} {dl <dashlength>}}
#                      {size <XX>{unit},<YY>{unit}}
#

set terminal pdf enhanced color solid rounded fsize 18 size 10,6
set output fname."-".time.".pdf"

set style function lines
set size 1.0, 1.0
set origin 0.0, 0.0
set key inside bottom right autotitle column nobox samplen 1
set xr [0.0:265.0]
set yr [0:2000]

set multiplot
set size 0.5,0.5
set origin 0.0,0.5
set grid

set title "a) No Adaptation"
#set xlabel "time (s)"
set ylabel "Throughput (kbps)" offset 1,0


#set xr [0.0:265.0]
#set yr [0:3000]
#unset xtics

plot  "bw_output.txt" using 1:2 lc 2 lt 2 title '3G Link' with steps  ,\
		"bw_noadap.txt" using 1:2 lc -1 lw 3 title 'Receiver Rate' with steps
		
set xtics nomirror
set size 0.5,0.5
set origin 0.0,0.0
set title "c) Rate Switching"
#set label 1 ""
set ylabel "Throughput (kbps)" offset 1,0
set xlabel "time (s)"
#set ytics 0.1
#set xr [0.0:265.0]
#set yr [0:3000]

unset key


plot  "bw_output.txt" using 1:2 lc 2 lt 2 title '3G Link' with steps  ,\
		"bw_rs.txt" using 1:2 lc -1 lw 3 title 'Receiver Rate' with steps
		
		
set size 0.5,0.5
set origin 0.5,0.5
set title "b) Omniscient"
#set ylabel "Throughput (kbps)" offset 1,0
#set xlabel "time (s)"
unset xlabel
unset ylabel
#set xr [0.0:265.0]
#set yr [0:3000]
#unset xtics


plot  "bw_output.txt" using 1:2 lc 2 lw 2 title '3G Link' with steps  ,\
"bw_perfect.txt" using 1:2 lc -1 lw 3 title 'Receiver Rate' with steps  #,\


set origin .5,0.
set title "d) Late Scheduling"
#set xr [0.0:265.0]
#set yr [0:3000]
unset ylabel
set xlabel "time (s)"
#set ytics 0.1

plot  "bw_output.txt" using 1:2 lc 2 lt 2 title '3G Link' with steps  ,\
		"bw_lazy.txt" using 1:2 lc -1 lw 3 title 'Receiver Rate' with steps

unset multiplot