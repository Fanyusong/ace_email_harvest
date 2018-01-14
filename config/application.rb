require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'csv'
require 'sidekiq'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AceEmailHarvest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sucker_punch

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 :headers => :any,
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                 :methods => [:get, :post, :options, :delete, :put]
      end
    end

    # require Rails.root.join('lib', 'email_tracker', 'rack')
    # # Some other stuff
    # config.middleware.use EmailTracker::Rack
    config.time_zone = 'Hanoi'
  end
end
EmailVerifier.config do |config|
  config.verifier_email = "realname@realdomain.com"
end

