class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :authors
      t.datetime :built_at
      t.string :number
      t.integer :downloads
      t.string :description
      t.string :summary
      t.string :platform
      t.boolean :prerelease
      t.integer :rubygem_id, :null => false
    end

    add_index :versions, :rubygem_id
  end
end
