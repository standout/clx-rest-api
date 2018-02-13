module CLXRestAPI
  module EndpointDSL
    def define_endpoint(name, method, uri)
      define_method(name) do |body = {}|
        uri = URIInterpretation.new(uri, @config).to_s
        CLXRestAPI::Request.new(uri, method: method).execute(body)
      end
    end
  end
end
