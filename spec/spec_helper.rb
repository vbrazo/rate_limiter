require 'mock_redis'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('dummy/config/environment.rb', __dir__)

require 'spec_helper'
require 'bundler/setup'
Bundler.setup

require 'rspec/rails'
require 'rate_limiter'
