reset
set terminal wxt dashed enhanced font 'arial,12' fontscale 0.5
set encoding utf8
unset output  # Remove output file directive to show plot in a window
set xlabel "x"
set ylabel "y"
set grid
#set size square


plot 'Fisher.txt' u 1:2 w l lw 2 title 'simulation', 'Fisher.txt' u 1:3 w l lw 2 title 'Analytical'