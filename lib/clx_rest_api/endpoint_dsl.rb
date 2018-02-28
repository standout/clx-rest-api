require "clx_rest_api/uri_interpretation"
require "clx_rest_api/request"
require "ostruct"

module CLXRestAPI
  module EndpointDSL
    def define_endpoint(name, method, uri)
      define_method(name) do |args = {}|
        new_uri = URIInterpretation.new(uri, OpenStruct.new(args), config: @config).to_s
        request = CLXRestAPI::Request.new(new_uri, method: method, config: @config)
        request.execute(args[:params] || {})
      end
    end
  end
end
