require File.expand_path("../helper", __FILE__)
require 'csv'

result = Version.group(:rubygem_id).order(:built_at).group_by {|version|
  version.built_at.to_date
}
count = 0
(Date.parse("2004-03-14")...result.keys.last).each {|date|
  c = result.include?(date) ? result[date].size : 0
  count += c
  gems = result.include?(date) ? result[date].map{|v|v.rubygem.name} : []
  puts [date, count, c, *(gems)].join(" ")
}
