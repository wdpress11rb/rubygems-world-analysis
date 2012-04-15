require "logger"
require "bundler"
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => File.expand_path("../../../db/models.sqlite3", __FILE__)
)

ActiveRecord::Base.logger = Logger.new("/dev/null")
