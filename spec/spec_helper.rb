require "bundler/setup"
require "clx_rest_api"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Configure credentials for API
  CLXRestAPI.configure do |config|
    config.service_plan_id = "my_service_plan_id"
    config.api_token = "my_api_token"
  end
end
