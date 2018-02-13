# CLXRestAPI
Made for creating easy integration with the CLX Rest API.
You can find their API documentation [here](https://www.clxcommunications.com/docs/sms/http-rest.html).
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clx_rest_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clx_rest_api

## Configuration
To use the API you need a service plan id and a token.
Use the configuration block to set these.

```ruby
CLXRestAPI.configure do |config|
  config.service_plan_id = "my_service_plan_id"
  config.api_token = "my_api_token"
end
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/clx_rest_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
