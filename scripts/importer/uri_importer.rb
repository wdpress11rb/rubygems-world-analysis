require File.expand_path("../../helper", __FILE__)

require File.expand_path('../../../lib/library', __FILE__)

Library.all.each do |library|
  id = library.id

  rubygem = Rubygem.find_by_serial(id)
  rubygem.homepage_uri = library.body.homepage_uri
  rubygem.source_code_uri = library.body.source_code_uri
  rubygem.save!
end
