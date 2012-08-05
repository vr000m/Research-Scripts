# Gnuplot script file for plotting data in file "force.dat"
      # This file is called   force.p
	  name="graph_route_thin_throughput"
	  #set term canvas
	  #set output name.".html"
	
#      set terminal png crop enhanced font "/Library/Fonts/Arial.ttf" 14 size 640,480 
#	  set output name.".png"
	time=system("date +%Y_%m_%d_%H_%M_%S")

	#set terminal pdf {monochrome|color|colour}
	#                      {{no}enhanced}
	#                      {fname "<font>"} {fsize <fontsize>}
	#                      {font "<fontname>{,<fontsize>}"}
	#                      {linewidth <lw>} {rounded|butt}
	#                      {solid|dashed} {dl <dashlength>}}
	#                      {size <XX>{unit},<YY>{unit}}
	#

	set terminal pdf color enhanced rounded size 12,6.2 #fsize 20
	set output name."-".time.".pdf"
	set key right top inside
	set pointsize 2.5
      set   autoscale                        # scale axes automatically
      unset log                              # remove any log-scaling
      unset label                            # remove any previous labels
      set xtic auto                          # set xtics automatically
      set ytic auto                          # set ytics automatically
      set xlabel "locations (lat,lon)" offset 0,-4.5 font "Times, 20"
      set ylabel "throughput (kbps)"  offset -6,0 font "Times, 20"
      set size ratio 0.5
	  set xrange [0:56]
	set grid  #linetype 1 linewidth 0.500,  linetype -1 linewidth 0.500
	set ytics 500 font "Times,16" border in scale 0,0  offset character 0, 0, 0 
	set xtics format "%f,%f"
    set xtics border out scale 0,0 mirror rotate by -45  offset character 0, 0, 0 font "Times,12" 0,5

      plot  "test_thin.txt" using 3:xtic(2) title '' with lines lw 2 lc -1, \
				"" using :4 title '' with lines lw 2 lc -1,\
				"" using :3:4 with filledcurve title '' lt 1 lc 0, \
				"" using :5 title '{/Times=20  Intermediate Quartile Range}' with lp lw 5 lt 3 lc -1 points 1