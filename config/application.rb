require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
path = File.expand_path('../application.yml', __FILE__)
puts "Path: #{path}"
CONFIG = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))[Rails.env]
puts 'Loading config/application.rb'
puts "Loading current application.yml config: #{CONFIG}"

CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.symbolize_keys!

module TestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.active_job.queue_adapter = :sidekiq
  end
end
