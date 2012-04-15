require File.expand_path("../../helper", __FILE__)

require File.expand_path('../../../lib/version', __FILE__)

Versioning.all.each do |versioning|
  name = versioning.name
  rubygem = Rubygem.find_by_name(name)
  puts rubygem.name
  versioning.body.each do |v|
    version = Version.find_by_rubygem_id_and_number(rubygem.id, v['number']) || Version.create!(:rubygem => rubygem, number: v['number'])
    version.rubygem = rubygem
    version.built_at = Time.parse(v['built_at'])
    version.authors = v['authors']
    version.downloads = v['downloads_count']
    version.description = v['description']
    version.summary = v['summary']
    version.platform = v['platform']
    version.prerelease = v['prerelease']
    version.save!
  end
end

puts Versioning.all.inject(0){|v,r|r+=v.body.size}
puts Rubygem.count
puts Version.count
