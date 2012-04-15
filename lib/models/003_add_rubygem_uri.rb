class AddRubygemUri < ActiveRecord::Migration
  def change
    add_column :rubygems, :homepage_uri, :string
    add_column :rubygems, :source_code_uri, :string
  end
end
