# Glasshouse

Have a known ENV for running code.  Grow the lushest code and juciest methods.

## Usage

### Grow new environment variables for a short time
```ruby
ENV[:tomatoes] #=> nil
Glasshouse.plant {:tomatoes => 'delicious'} do
  ENV[:tomatoes] #=> 'delicious'
end
ENV[:tomatoes] #=> nil
```

### Remove an environment variable for a short time
```ruby
ENV[:peppers] #=> 'awful'

Glasshouse.prune :peppers do
  ENV[:peppers] #=> nil
end

ENV[:peppers] #=> 'awful'
``` 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'glasshouse'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glasshouse

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/glasshouse. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.