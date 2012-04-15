require File.expand_path("../../helper", __FILE__)

require File.expand_path('../../../lib/library', __FILE__)

Library.all.each do |library|
  id   = library.id
  name = library.name
  body = library.body

  downloads    = body.downloads
  author_names = body.authors

  rubygem = Rubygem.find_by_serial(id) || Rubygem.create!(:serial => id, :name => name, :downloads => downloads)

  author_names.each do |author_name|
    author = Author.find_or_create_by_name(author_name)

    unless Commit.exists?(:author_id => author.id, :rubygem_id => rubygem.id)
      Commit.create!(:author => author, :rubygem => rubygem)
    end
  end
end

Library.all.each do |library|
  id   = library.id
  name = library.name
  body = library.body

  rubygem = Rubygem.find_by_serial(id)

  body.dependencies.runtime.each do |dependency|
    parent = Rubygem.find_by_name(dependency.name)
    next if parent.nil?

    record = Dependency.find_by_parent_id_and_child_id(parent.id, rubygem.id) || Dependency.create(:parent_id => parent.id, :child_id => rubygem.id)
  end
end

puts Library.count
puts Rubygem.count
puts Author.count
puts Dependency.count
