class Rubygem < ActiveRecord::Base
  has_many :commits
  has_many :versions
  has_many :authors, :through => :commits
  has_many :dependencies_as_parent, :foreign_key => "parent_id", :class_name => "Dependency"
  has_many :dependencies_as_child,  :foreign_key => "child_id",  :class_name => "Dependency"
  has_many :parents,  :through => :dependencies_as_child,  :source => :parent
  has_many :children, :through => :dependencies_as_parent, :source => :child
end
