require 'bundler'
require 'gnuplot'

def gnuplot(datafile, opts)
  output = File.expand_path(File.basename(opts[:output] || datafile,".*")+".eps",File.dirname(datafile))
  Gnuplot.open do |gp|
    Gnuplot::Plot.new(gp) do |plot|
      plot.terminal 'postscript eps enhanced "Monaco"'
      plot.output output
      plot.border 3
      plot.xtics "nomirror"
      plot.ytics "nomirror"
      plot.format 'y "%.0f"'
      plot.xlabel opts[:xlabel]
      plot.ylabel opts[:ylabel]
      plot.title opts[:title]
      yield plot
      plot.data << Gnuplot::DataSet.new('"'+datafile+'"') do |ds|
        ds.using = "1:3"
        ds.with = "line"
        ds.title = "GitHub Hosting"
        ds.linewidth = 8
      end
      plot.data << Gnuplot::DataSet.new('"'+datafile+'"') do |ds|
        ds.using = "1:2"
        ds.with = "line"
        ds.title = "Rubyforge Hosting"
        ds.linewidth = 8
      end
      plot.data << Gnuplot::DataSet.new('"'+datafile+'"') do |ds|
        ds.using = "1:4"
        ds.with = "line"
        ds.title = "Others"
        ds.linewidth = 4
      end
    end
  end
  puts output
end

gnuplot(File.expand_path("../hosting_transition.dat",__FILE__), {
  title: "Hosting Transition",
  xlabel: "Time",
  ylabel: "Ammount"
}) do |plot|
  plot.xdata "time"
  plot.timefmt '"%Y-%m-%d"'
  plot.format 'x "%Y-%m"'
  plot.xrange '["2004-01-01":"2012-06-31"]'
  plot.yrange '[0:27000]'
end
