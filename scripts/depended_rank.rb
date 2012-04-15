require File.expand_path("../helper", __FILE__)

Dependency.group(:parent_id).count.sort_by { |entry|
  entry[1] * -1
}[0...50].each_with_index { |entry, index|
  puts "%2d : %4d : %s" % [index + 1, entry[1], Rubygem.find(entry[0]).name]
}
