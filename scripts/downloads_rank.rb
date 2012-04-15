require File.expand_path("../helper", __FILE__)

if @data_mode
  Rubygem.order("downloads DESC").each { |gem|
    puts "%d,%s" % [gem.downloads, gem.name]
  }
  exit
end

Rubygem.order("downloads DESC").limit(30).each_with_index { |gem, index|
  puts "%2d : %d : %s" % [index + 1, gem.downloads, gem.name]
}
