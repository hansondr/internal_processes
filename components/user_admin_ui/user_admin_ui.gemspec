$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'user_admin_ui/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'user_admin_ui'
  s.version     = UserAdminUi::VERSION
  s.authors     = ['Daniel Hanson']
  s.email       = ['dan.hanson@americanfinancing.net']
  s.summary     = 'User admin UI component'

  s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.1'
  s.add_dependency 'haml-rails', '0.9.0'
  s.add_dependency 'jquery-rails', '4.0.3'

  s.add_dependency 'user_data'
  s.add_dependency 'admin_assets'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'capybara'

  s.test_files = Dir['spec/**/*']
end
