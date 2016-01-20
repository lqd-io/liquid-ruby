# Liquid

 Ruby wrapper for the Liquid API (analyze and collect)

This gem is currently in development, it might break something :grimacing:

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'liquid-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liquid-ruby

## Usage

#### Setup authentication

```ruby
Liquid.configure do |config|
  config.analyze_api = 'your_analyze_token'
  config.collect_api = 'your_collect_token'
end
```

#### Track event

```ruby
user_attrs = { unique_id: 'your_unique_id', age: 25, premium: true }
event_attrs = { name: 'buy' }

Liquid.track(user_attrs, event_attrs)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at:

https://github.com/lqd-io/liquid-ruby
