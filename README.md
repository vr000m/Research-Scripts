## Scripts

* `colconcat.py`: Simple script to concatenate my simulations results
* `markov_loss.py`: Simple function to generate loss patterns based on a
  two-state markov chain. `markov_loss(p,q)`
* `perinst.awk`: averaging time series data into **1s intervals**
* `\gnuplot\`: Scripts to create plots (stacked multiplot, quad plots, stacked
  curves, etc). More at [Gnuplot Demo](http://gnuplot.sourceforge.net/demo_cvs/)
* `gstreamer.cli`: [Gstreamer](http://gstreamer.freedesktop.org/) command
  lines
* `tcptrace.cli`: [tcpdump](http://www.tcpdump.org/) to
  [tcptrace](http://www.tcptrace.org/) to [gnuplot](http://www.gnuplot.info/)
  toolchain
* `\dummynet\`: Scripts to run automate dummynet simulations (based on input
  from @marcinag)
* `laf.py`: Simple script that goes through my thesis .tex files and looks for
  acronyms. It stores the acronyms in the `tex files` and compares with those
  already listed in `list.tex` file. Also ignores words listed in `abbr.ignore`