module RateLimiter
  class Configuration
    attr_accessor :rate_default,
                  :period_default,
                  :force_rate_limit,
                  :force_period
  end

  class << self
    def configure
      yield(configuration)

      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
