ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("dummy/config/environment.rb", __dir__)

require 'spec_helper'
require 'bundler/setup'
Bundler.setup

require 'active_record'
require 'rspec/rails'
require 'rate_limiter'

require "support/database_cleaner"
require "support/shoulda_matchers"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.use_transactional_fixtures = true
end
