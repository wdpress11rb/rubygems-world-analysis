class Author < ActiveRecord::Base
  has_many :commits
  has_many :rubygems, :through => :commits
end
