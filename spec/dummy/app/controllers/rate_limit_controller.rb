class RateLimitController < ApplicationController
  include RateLimiter::RateLimit

  def index; end
end
