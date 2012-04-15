require 'bundler'
require 'gnuplot'

def gnuplot(datafile, opts)
  output = File.expand_path(File.basename(opts[:output] || datafile,".*")+".eps",File.dirname(datafile))
  Gnuplot.open do |gp|
    Gnuplot::Plot.new(gp) do |plot|
      plot.terminal 'postscript eps enhanced "Monaco"'
      plot.output output
      plot.nokey
      plot.border 3
      plot.xtics "nomirror"
      plot.ytics "nomirror"
      plot.format 'y "%.0f"'
      plot.xlabel opts[:xlabel]
      plot.ylabel opts[:ylabel]
      plot.title opts[:title]
      yield plot
      plot.data << Gnuplot::DataSet.new('"'+datafile+'"') do |ds|
        ds.using = opts[:using] || 1
        ds.with = "line"
        ds.linewidth = 8
      end
    end
  end
  puts output
end
