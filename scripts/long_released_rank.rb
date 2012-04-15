require File.expand_path("../helper", __FILE__)

Rubygem.includes(:versions).all.map {|r|
  if r.versions.count <= 1
    nil
  else
    {rubygem: r, distance: (r.versions.order(:built_at).last.built_at.to_date - r.versions.order(:built_at).first.built_at.to_date)/365}
  end
}.compact.sort_by {|h| h[:distance] * -1 }[0...30].each_with_index {|record, index|
  d = record[:distance]
  puts "%2d : %2d years %3d days : %3s versions : %s" % [index + 1, d.floor, (d - d.floor).numerator, record[:rubygem].versions.count, record[:rubygem].name]
}
