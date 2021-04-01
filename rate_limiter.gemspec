$LOAD_PATH.push File.expand_path("lib", __dir__)

require "rate_limiter/version"

Gem::Specification.new do |spec|
  spec.name        = "rate_limiter_engine"
  spec.version     = RateLimiter::VERSION
  spec.authors     = ["Vitor Oliveira"]
  spec.email       = ["vbrazo@gmail.com"]
  spec.summary     = "Rate Limiter for Rails APIs"
  spec.description = "Rate Limiter for Rails APIs"
  spec.files       = Dir["{lib}/**/*"]

  spec.add_dependency 'rails', '~> 6.1.3'
  spec.add_dependency 'redis', '~> 4.0'

  spec.add_development_dependency 'mock_redis'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rspec-rails'
end
