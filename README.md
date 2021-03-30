# Rate Limiter

Rate Limiter is a rails engine that can easily limit requests per client.

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
