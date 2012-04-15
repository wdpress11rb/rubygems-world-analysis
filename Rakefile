require File.expand_path('../lib/fetcher', __FILE__)

namespace :store do
  desc "Store library names to database"
  task :titles do
    Fetcher.store_titles
  end

  desc "fetch library infomation"
  task :information do
    Fetcher.store_information
  end

  desc "fetch library versions"
  task :version do
    if ENV["fetched"]
      Fetcher.store_version(ENV["fetched"])
    end
    Fetcher.store_version
  end
end
