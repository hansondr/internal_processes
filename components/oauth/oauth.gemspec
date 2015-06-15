$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "oauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "oauth"
  s.version     = Oauth::VERSION
  s.authors     = ["Daniel Hanson"]
  s.email       = ["dan.hanson@americanfinancing.net"]
  s.summary     = "OAuth2 component"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "omniauth"
  s.add_dependency "omniauth-google-oauth2"

  s.add_dependency 'user_data'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"

  s.test_files = Dir['spec/**/*']
end