require "clx_rest_api/uri_interpretation"
require "clx_rest_api/endpoint_dsl"

module CLXRestAPI
  class Client
    extend EndpointDSL

    define_endpoint :send_batch_message, :post, "/xms/v1/:service_plan_id/batches"

    def initialize(config = ::CLXRestAPI.config)
      @service_plan_id = config.service_plan_id
      @api_token = config.api_token
      @config = config
    end
  end
end
