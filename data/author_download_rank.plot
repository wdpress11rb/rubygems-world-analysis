# gnuplot -p data/download_rank.plot

#set logscale
set format y "%.0f"
set xlabel "Ranking"
set ylabel "Author Downloaded Counts"
plot "data/author_download_rank.dat" using 1 title "Author Downloaded Counts Ranking"
