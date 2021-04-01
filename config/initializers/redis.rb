require 'redis'

$redis = if ENV['RAILS_ENV'] = 'test'
           MockRedis.new
         else
           Redis.new(Rails.application.config_for(:redis))
         end
