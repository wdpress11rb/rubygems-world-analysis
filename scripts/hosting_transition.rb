require File.expand_path("../helper", __FILE__)

result = Version.group(:rubygem_id).order(:built_at).group_by {|version|
  version.built_at.to_date
}
count = {rubyforge: 0, github: 0, total: 0}
(Date.parse("2004-03-14")...result.keys.last).each {|date|
  if result.include?(date)
    result[date].each {|version|
      count[:rubyforge] += 1 if (version.rubygem.homepage_uri =~ /rubyforge\.org/ || version.rubygem.source_code_uri =~ /rubyforge\.org/)
      count[:github] += 1 if (version.rubygem.homepage_uri =~ /github\.com/ || version.rubygem.source_code_uri =~ /github\.com/)
    }
    count[:total] += result[date].size
  end
  puts [date, count[:rubyforge], count[:github], count[:total] - count[:rubyforge] - count[:github], count[:total]].join(" ")
}
