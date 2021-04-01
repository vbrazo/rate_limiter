module RateLimiter
  module RateLimit
    extend ActiveSupport::Concern

    @@rate = {}
    @@rate_default = ::RateLimiter.configuration.rate_default || 100
    @@period = {}
    @@period_default = ::RateLimiter.configuration.period_default || 100

    included do
      before_action :rate_limiter

      def self.rate(rate)
        @@rate[controller_name] = rate
      end

      def self.period(period)
        @@period[controller_name] = period
      end
    end

    protected

    def rate_limiter
      rate_limiter_object.count
      rate_limiter_object.increment

      render_limit_exceeded if rate_limiter_object.blocked?
    end

    def render_limit_exceeded
      render json: {
        message: "Rate limit exceeded. Try again in #{rate_limiter_object.cooldown_period} seconds"
      }, status: :too_many_requests
    end

    def client_key
      "#{request.env['REMOTE_IP']}_counter"
    end

    def rate_limiter_object
      RateLimiter.new(client_key)
    end
  end
end
