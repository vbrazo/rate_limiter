# Rate Limiter

Rate Limiter is a rails engine that can easily limit requests per client.

First, create an initializer for your Rate Limiter engine and set the default properties:

```ruby
# config/initializers/rate_limiter.rb
RateLimiter.configure do |config|
  config.rate_default = 2
  config.period_default = 2
  config.force_rate_limit = 100
  config.force_period = 2
end
```

To add it, all you have to do is `include RateLimiter::RateLimit` in ApplicationController to have it on all your controllers using default settings of 100 request per hour (3600 seconds).

You can also add it directly to the controller you want to be rate limited.

To customize, just use helper methods `rate` and `period`, as following:

```ruby
class ApplicationController < ActionController::Base
  include RateLimiter::RateLimit

  rate 100
  period 3600

  …
end
```
