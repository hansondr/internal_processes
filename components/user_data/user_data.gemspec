$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_data/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_data"
  s.version     = UserData::VERSION
  s.authors     = ["Daniel Hanson"]
  s.email       = ["dan.hanson@americanfinancing.net"]
  s.summary     = "User-centric data component"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "activerecord", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "rails"

  s.test_files = Dir['spec/**/*']
end
