# gnuplot -p data/release_count.plot

#set logscale
set format y "%.0f"
set xlabel "Ranking"
set ylabel "Releases"
plot "data/release_count_rank.dat" title "Release Count Ranking"
