$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "admin_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "admin_assets"
  s.version     = AdminAssets::VERSION
  s.authors     = ["Daniel Hanson"]
  s.email       = ["dan.hanson@americanfinancing.net"]
  s.summary     = "Shared web assets for admin components"

  s.files = Dir["{app,config,db,lib}/**/*", "README.md"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml-rails", "0.9.0"
  s.add_dependency "jquery-rails", "4.0.3"
end
