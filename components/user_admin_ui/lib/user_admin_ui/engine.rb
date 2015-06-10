module UserAdminUi
  class Engine < ::Rails::Engine
    isolate_namespace UserAdminUi
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths["db/migrate"].concat config.paths["db/migrate"].expanded
      end
    end
  end
end
