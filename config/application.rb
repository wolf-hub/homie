require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Homie
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_job.queue_adapter = Rails.env.production? ? :sidekiq : :async
    config.assets.initialize_on_precompile = false
    config.assets.paths << Rails.root.join("app", "assets")
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
    config.assets.precompile += %w(rails_admin/rails_admin.css rails_admin/rails_admin.js)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end
