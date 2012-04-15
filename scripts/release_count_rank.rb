require File.expand_path("../helper", __FILE__)
require 'csv'

if @data_mode
  Version.group(:rubygem_id).count.sort_by { |v| -v[1] }.map { |rubygem_id, count|
    puts [count, Rubygem.find(rubygem_id).name].to_csv
  }
  exit
end

Version.where(:prerelease => false).group(:rubygem_id).count.sort_by { |v| -v[1] }[0...30].map { |rubygem_id, count|
  { :rubygem => Rubygem.find(rubygem_id), :count => count }
}.each_with_index { |record, index|
  puts "%2d : %3d : %s" % [index + 1, record[:count], record[:rubygem].name]
}
