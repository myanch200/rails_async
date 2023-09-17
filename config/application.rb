require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsAsync
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, see https://guides.rubyonrails.org/autoloading_and_reloading_constants.html#config-autoload-lib-ignore.
    config.autoload_lib(ignore: %w(assets tasks))
    config.action_view.image_loading = "lazy"

    # set redis as cache store

    config.cache_store = :redis_cache_store, { url: ENV["REDIS_URL"] }
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
