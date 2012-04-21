require File.expand_path('../gnuplot',__FILE__)

logscale = ARGV[0] == "logscale"

gnuplot(File.expand_path("../download_rank.dat",__FILE__), {
  title: "Download Ranking#{" (Log Scale)" if logscale}",
  xlabel: "Ranking",
  ylabel: "Downloads",
  output: (logscale ? "download_rank_logscale.eps" : nil)
}) do |plot|
  plot.logscale if logscale
end
