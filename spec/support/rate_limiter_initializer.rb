RateLimiter.configure do |config|
  config.rate_default = 2
  config.period_default = 2
  config.force_rate_limit = 100
  config.force_period = 2
end
