require File.expand_path("../../lib/models/connection", __FILE__)

%w(author rubygem commit dependency version).each do |model|
  require File.expand_path("../../lib/models/#{model}", __FILE__)
end

require "optparse"
opt = OptionParser.new
opt.on("-r") {|n|
  #do nothing for `pry -r ./script/helper.rb`
}
opt.on("-d","--data") {|boolean|
  @data_mode = boolean
}
opt.parse!(ARGV)
