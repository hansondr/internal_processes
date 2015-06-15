ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'

require 'rspec/rails'
require 'database_cleaner'
require 'factory_girl_rails'
require 'capybara/rails'
require 'capybara/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

require_relative '../components/user_admin_ui/spec/support/oauth_integration_spec_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = false 
  config.profile_examples = nil 
  config.order = :random
  Kernel.srand config.seed

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end