require File.expand_path("../helper", __FILE__)
require 'csv'

if @data_mode
  Commit.group(:author_id).count.sort_by { |c| -c[1] }.map { |author_id, count|
    puts [count, Author.find(author_id).name.gsub(/\n/," ")].to_csv
  }
  exit
end

Commit.group(:author_id).count.sort_by { |c| -c[1] }[0...30].map { |author_id, count|
  { :author => Author.find(author_id), :count => count }
}.each_with_index { |record, index|
  puts "%2d : %3d : %s" % [index + 1, record[:count], record[:author].name]
}
