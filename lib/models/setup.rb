require File.expand_path("../connection", __FILE__)

ActiveRecord::Migrator.migrate(File.expand_path("..", __FILE__))
