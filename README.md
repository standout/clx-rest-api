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
To use the API create an instance of the `CLXRestAPI::Client` class.
You can send a request to an endpoint like this:
```ruby
client = CLXRestAPI::Client.new
client.send_batch_message(params: {})
```

This returns a `CLXRestAPI::Response` instance.
```ruby
# Contains the response body parsed from JSON
response.body

# Contains a Net::HTTP response for further debugging
response.original_response
```

## Available endpoints
As of now these are the available endpoints:
- :send_batch_messsage, docs: https://www.clxcommunications.com/docs/sms/http-rest.html#send-a-batch-message
- :retrieve_delivery_report, docs: https://www.clxcommunications.com/docs/sms/http-rest.html#retrieve-a-delivery-report

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To define a new endpoint for the client you can use the provided DSL:
```ruby
define_endpoint :my_endpoint, :get, "/my_url/:my_param/
```

`:my_param` will be fetched from the arguments provided when doing the method call.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/standout/clx_rest_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
