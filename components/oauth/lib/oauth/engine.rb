module Oauth
  class Engine < ::Rails::Engine
    isolate_namespace Oauth
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.generators do |g|
      g.orm :active_record
      g.template_engine :haml
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths["db/migrate"].concat config.paths["db/migrate"].expanded
      end
    end

    initializer 'oauth.add_middleware' do |app|
      app.middleware.use OmniAuth::Builder do
        provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
        {
          name: 'google',
          scope: 'email',
          prompt: 'select_account',
          hd: 'americanfinancing.net'
        }
      end
    end
  end
end
