Gem::Specification.new do |s|
  s.name = 'chef-handler-growl'
  s.version = '0.1'
  s.platform = Gem::Platform::RUBY
  s.summary = "Chef report handler to send Growl notification"
  s.description = s.summary
  s.author = "Joshua Timberman"
  s.email = "opensource@housepub.org"
  s.homepage = "http://github.com/jtimberman/chef-handler-growl"
  s.require_path = 'lib'
  s.files = %w(LICENSE README.md) + Dir.glob("lib/**/*")
  s.add_dependency "ruby_gntp", "~> 0.3.4"
end
