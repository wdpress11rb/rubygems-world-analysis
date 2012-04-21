require File.expand_path('../gnuplot',__FILE__)

logscale = ARGV[0] == "logscale"

gnuplot(File.expand_path("../author_rank.dat",__FILE__), {
  title: "Author Ranking#{" (Log Scale)" if logscale}",
  xlabel: "Ranking",
  ylabel: "Created Gems",
  output: (logscale ? "author_rank_logscale.eps" : nil)
}) do |plot|
  plot.logscale if logscale
end
