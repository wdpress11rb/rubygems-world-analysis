require 'json'
require 'ostruct'
require "open-uri"
require "bundler"
Bundler.require

Sequel.connect("sqlite://#{File.expand_path('../../', __FILE__)}/db/database.sqlite3")

class Versioning < Sequel::Model
  db.create_table?(:versions) do
    primary_key :id
    String :name
    String :json
    Time   :fetched_at, default: Time.now
    index :name
  end
  set_dataset(:versions)

  plugin :validation_helpers
  def validate
    validates_unique :name
  end

  def fetch_json
    open("https://rubygems.org/api/v1/versions/#{name}.json") do |f|
      update(json: f.read, fetched_at: Time.now)
    end
  end

  def body
    JSON.parse(json)
  end
end
