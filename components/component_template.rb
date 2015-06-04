component_name = Rails.root.to_s.split('/')[-3]
component_root = Rails.root.to_s.gsub('spec/dummy', '')

gemspec = <<-EOS
  s.add_development_dependency \"rspec-rails\"
  s.add_development_dependency \"factory_girl_rails\"
  s.add_development_dependency \"shoulda-matchers\"
  s.add_development_dependency \"database_cleaner\"

  s.test_files = Dir['spec/**/*']
EOS

inject_into_file "#{component_root}/#{component_name}.gemspec",
                 gemspec,
                 after: "s.add_development_dependency \"sqlite3\"\n"

engine_config = <<-EOS

    config.autoload_paths += Dir["\#{config.root}/lib/**/"]

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
EOS

inject_into_file "#{component_root}/lib/#{component_name}/engine.rb",
                 engine_config,
                 after: "isolate_namespace #{component_name.camelize}"

run "bundle install"
