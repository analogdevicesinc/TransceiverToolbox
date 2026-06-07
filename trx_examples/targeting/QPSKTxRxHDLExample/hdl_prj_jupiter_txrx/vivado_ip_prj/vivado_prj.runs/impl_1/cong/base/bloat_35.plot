set title "bloat_35"
set palette negative rgbformula 21,22,23
set cbrange [0:2]
set yrange [180:0]
set size ratio 2.76923
set view map
splot "bloat_35.dat" using 1:2:3 with image
pause -1
