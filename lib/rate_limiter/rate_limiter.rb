module RateLimiter
  class RateLimiter
    def initialize(client_key)
      @client_key = client_key
    end

    attr_reader :client_key

    def blocked?
      counter.present? && limit_exceeded
    end

    def count
      return if counter

      set_client_key
      set_expire
    end

    def increment
      $redis.incr(client_key)
    end

    def cooldown_period
      $redis.ttl(client_key)
    end

    private

    def counter
      $redis.get(client_key)
    end

    def limit_exceeded
      counter.to_i > rate_limit.to_i
    end

    def set_client_key
      $redis.set(client_key, 0)
    end

    def set_expire
      $redis.expire(client_key, period)
    end

    def rate_limit
      force_rate_limit || rate_default
    end

    def period
      force_period || period_default
    end

    def force_rate_limit
      ::RateLimiter.configuration.force_rate_limit
    end

    def rate_default
      ::RateLimiter.configuration.rate_default
    end

    def force_period
      ::RateLimiter.configuration.force_period
    end

    def period_default
      ::RateLimiter.configuration.period_default
    end
  end
end
