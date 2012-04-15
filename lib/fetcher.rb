require 'json'
require File.expand_path('../library', __FILE__)
require File.expand_path('../version', __FILE__)

class Fetcher
  def self.store_titles
    `gem list -r`.each_line do |line|
      name = line.chomp.split(" ").first
      Library.new(name: name).save

      # puts first comming initial's library
      if @initial.nil? || @initial != name[0].downcase
        puts name
      end
      @initial = name[0].downcase
    end
  end

  def self.store_information
    puts "Fetching... : %s" % Library.count
    Library.all.each do |library|
      puts "Fetching: %s" % library.name
      library.fetch_json
      information = JSON.parse(library.json)
      puts "Fetched : version(%s), %s downloads" % [information["version"], information["downloads"]]
      sleep 3
    end
  end

  def self.store_version(last_fetched)
    puts "Fetching... : %s" % Library.count
    started = false
    Library.order(:name).each do |library|
      if !started
        puts "Fetched: %s" % library.name
        if library.name == last_fetched
          started = true
        end
        next
      end
      puts "Fetching: %s" % library.name
      version = Versioning.create(name: library.name)
      version.fetch_json
      information = JSON.parse(version.json)
      if information.size == 0
        puts "Fetched : %s versions" % information.size
      else
        puts "Fetched : %s versions, Latest %s" % [information.size, information[0]["built_at"]]
      end
      sleep 3
    end
  end
end
