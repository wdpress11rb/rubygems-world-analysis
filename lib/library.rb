require 'json'
require 'ostruct'
require "open-uri"
require "bundler"
Bundler.require

Sequel.connect("sqlite://#{File.expand_path('../../', __FILE__)}/db/database.sqlite3")

class Library < Sequel::Model
  db.create_table?(:libraries) do
    primary_key :id
    String :name
    String :json
    Time   :fetched_at, default: Time.now
    index :name
  end
  set_dataset(:libraries)

  plugin :validation_helpers
  def validate
    validates_unique :name
  end

  def fetch_json
    open("https://rubygems.org/api/v1/gems/#{name}.json") do |f|
      update(json: f.read, fetched_at: Time.now)
    end
  end

  class RecursiveOpenStruct < OpenStruct
    def new_ostruct_member(name)
      name = name.to_sym
      unless self.respond_to?(name)
        class << self; self; end.class_eval do
          define_method(name) {
            v = @table[name]
            case v
            when Hash
              RecursiveOpenStruct.new(v)
            when Array
              v.map {|vv| vv.is_a?(Hash) ? RecursiveOpenStruct.new(vv) : vv }
            else
              v
            end
          }
          define_method("#{name}=") {|x| modifiable[name] = x }
          define_method("#{name}_as_a_hash") { @table[name] }
        end
      end
    end
  end

  def body
    hash = JSON.parse(json)
    hash["authors"] = hash["authors"] ? hash["authors"].split(", ") : []
    while i = hash["authors"].index { |author| author =~ /^Inc[. )]/ || author =~ /^Inc$/ }
      hash["authors"][i-1] = [hash["authors"][i-1], hash["authors"][i]].join(", ")
      hash["authors"].delete_at i
    end
    RecursiveOpenStruct.new(hash)
  end
end
