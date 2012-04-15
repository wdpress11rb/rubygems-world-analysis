class Setups < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, :null => false
    end

    add_index :authors, :name, :unique => true

    create_table :rubygems do |t|
      t.integer :serial,   :null => false
      t.string  :name,     :null => false
      t.integer :downloads
    end

    add_index :rubygems, :serial,   :unique => true
    add_index :rubygems, :name,     :unique => true
    add_index :rubygems, :downloads

    create_table :commits do |t|
      t.integer :author_id,  :null => false
      t.integer :rubygem_id, :null => false
    end

    add_index :commits, :author_id
    add_index :commits, :rubygem_id
    add_index :commits, [:author_id, :rubygem_id], :unique => true

    create_table :dependencies do |t|
      t.integer :parent_id, :null => false
      t.integer :child_id,  :null => false
    end

    add_index :dependencies, :parent_id
    add_index :dependencies, :child_id
    add_index :dependencies, [:parent_id, :child_id], :unique => true
  end
end
