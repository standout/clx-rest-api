require "clx_rest_api/uri_interpretation"
require "clx_rest_api/endpoint_dsl"

module CLXRestAPI
  class Client
    extend EndpointDSL

    define_endpoint :send_batch_message, :post, "/batches"
    define_endpoint :retrieve_delivery_report, :get, "/batches/:batch_id/delivery_report"

    def initialize(config = CLXRestAPI.config)
      @config = config
    end
  end
end
