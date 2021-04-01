# Rate Limiter

[![CircleCI](https://circleci.com/gh/vbrazo/rate_limiter.svg?style=svg&circle-token=76a6a276549c313fa74076e5638a1d6d15cd5ee7)](<https://app.circleci.com/settings/project/github/vbrazo/rate_limiter>)
[![Gem Version](https://badge.fury.io/rb/rate_limiter_engine.svg)](https://badge.fury.io/rb/rate_limiter_engine)

Rate Limiter is a Rails engine that can easily limit requests per client in your Rails APIs.

## Problem

Rate limiting is the act of limiting the number of requests sent to or from a system. It's most often used to limit the number of incoming requests in order to prevent `DoS attacks` and can be enforced at the IP-address level, at the user-account level, or at the region level, for example.

#### DoS attack

Short for "denial-of-service attack", a DoS attack is an attack in which a malicious user tries to bring down or damage a system in order to render it unavailable to users. Much of the time, it consists of flooding it with traffic. Some DoS attacks are easily preventable with rate limiting, while others can be far trickier to defend against.

#### DDoS attack

Short for "distributed denial-of-service attack", a DDoS attack is a DoS attack in which the traffic flooding the target system comes from many different sources (like thousands of machines), making it much harder to defend against.

## Approach

In order to control the Rate Limiting, this Rails Engine proposes to use Redis and its in-memory key-value store. Redis offers some persistent storage options but is typically used as a really fast, best-effort caching solution. Redis is also often used to implement rate limiting.

### Usage

1. Create an initializer for your Rate Limiter engine and set the default properties:

```ruby
RateLimiter.configure do |config|
  config.rate_default = 2
  config.period_default = 2
  config.force_rate_limit = 100
  config.force_period = 2
end
```

2. To add a Rate Limiter, all you have to do is `include RateLimiter::RateLimit` in `ApplicationController` to have it on all your controllers using default settings of 100 request per hour (100 seconds).

You can also add it directly to the controller you want to be rate limited.

To customize, just use helper methods `rate` and `period`, as following:

```ruby
class ApplicationController < ActionController::Base
  include RateLimiter::RateLimit

  rate 100
  period 100

  …
end
```

## Available Docker commands

I built this engine with Docker so I'd suggest using it. All available commands are:

| Command      | Description                            |
|--------------|----------------------------------------|
| make build   | Build the application                  |
| make specs   | Run all the specs                      |
| make bash    | access the bash inside the container   |
