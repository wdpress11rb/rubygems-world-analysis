require File.expand_path('../gnuplot',__FILE__)

gnuplot(File.expand_path("../development_transition_detail.dat",__FILE__), {
  title: "Development Transition",
  xlabel: "Time",
  ylabel: "Ammount",
  using: "1:2"
}) do |plot|
  plot.xdata "time"
  plot.timefmt '"%Y-%m-%d"'
  plot.format 'x "%Y-%m"'
  plot.xrange '["2004-01-01":"2012-06-31"]'
end
