require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'

Bundler.require(*Rails.groups)
require 'rate_limiter'

module Dummy
  class Application < Rails::Application
    config.load_defaults 5.2
  end
end
