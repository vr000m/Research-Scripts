name=system("echo s17074-2p1") 
#set term canvas
#set output name.".html"
time=system("date +%Y_%m_%d_%H_%M_%S")

#set terminal png  crop enhanced font "/Library/Fonts/Arial.ttf" 14 size 1280,800 #transparent
#set output name."-".time.".png"

#set terminal pdf {monochrome|color|colour}
#                      {{no}enhanced}
#                      {fname "<font>"} {fsize <fontsize>}
#                      {font "<fontname>{,<fontsize>}"}
#                      {linewidth <lw>} {rounded|butt}
#                      {solid|dashed} {dl <dashlength>}}
#                      {size <XX>{unit},<YY>{unit}}
#

set terminal pdf enhanced rounded fsize 18 size 10,6
set output name."-".time.".pdf"

#set size 1,1  #default
set origin 0,0
set size ratio 0.25

unset title
#set key center below
#set key inside left top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 1.000

set tmargin 0
set bmargin 0
set lmargin 3
set rmargin 3
set xrange [0:264]

set multiplot layout 4,1

set key left autotitle column nobox samplen 1
#unset title
set style data boxes

set tics scale 0
set ylabel "Bitrate (kbps)"
set yrange [0:1100]
#unset ytics
set ytics 250
set ytics nomirror
unset xlabel
unset xtics

set style fill  transparent pattern 5 border
plot "rate1" using 1:3 with filledcurve x1 ls 1 title "Path A", \
    "srate1" using 1:5 with steps ls 3 title "3G link capacity"

set style fill  transparent pattern 6 border
plot "rate2" using 1:3 with filledcurve x1 ls 2 title "Path B",\
    "srate2" using 1:5 with steps ls 4 title "3G link capacity"

set xtics nomirror
set xtics 20
set style fill pattern 5 border
set xlabel "Time (s)"
set yrange [0:1.1]
set ylabel "Ratio"
set ytics 0.2

plot  "perc" using 1:2 notitle with filledcurve x1, \
	"perc" using 1:2:($3+$2) notitle with filledcurve axis x1y1
	
unset multiplot