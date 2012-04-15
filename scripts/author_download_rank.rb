require File.expand_path("../helper", __FILE__)
require 'csv'

if @data_mode
  Author.all.map {|author|
    {author: author, count: author.rubygems.pluck(:downloads).sum}
  }.sort_by{|r| -r[:count] }.each { |record|
    puts [record[:count], record[:author].name.gsub(/\n/," ")].to_csv
  }
  exit
end

Author.all.map {|author|
  {author: author, count: author.rubygems.pluck(:downloads).sum}
}.sort_by{|r| -r[:count] }[0...30].each_with_index { |record, index|
  puts "%2d : %8d : %s" % [index + 1, record[:count], record[:author].name]
}
