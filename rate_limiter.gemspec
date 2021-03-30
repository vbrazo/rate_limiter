$LOAD_PATH.push File.expand_path("lib", __dir__)

require "rate_limiter/version"

Gem::Specification.new do |spec|
  spec.name        = "rate_limiter"
  spec.version     = RateLimiter::VERSION
  spec.authors     = ["Vitor Oliveira"]
  spec.email       = ["vbrazo@gmail.com"]
  spec.summary     = "Rate Limiter for Rails APIs"
  spec.description = "Rate Limiter for Rails APIs"
  spec.files       = Dir["{lib}/**/*"]

  spec.add_dependency 'redis', '~> 4.0'

  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'shoulda-matchers'
end
