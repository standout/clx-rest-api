require "clx_rest_api/response"
require "net/http"

module CLXRestAPI
  class Request
    attr_reader :uri

    def initialize(uri, method: :get, config: CLXRestAPI.config)
      @config = config
      @method = method
      @uri = URI(uri)
    end

    def execute(body = {})
      response = http.request http_request(body)
      Response.new(response)
    end

    private

    def http
      @http ||= Net::HTTP.new(uri.host, uri.port)
      @http.tap do |protocol|
        protocol.use_ssl = true
        protocol.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end

    def http_request(body)
      send "#{@method}_request", body
    end

    def get_request(body)
      @uri.query = URI.encode_www_form(body)
      Net::HTTP::Get.new(@uri).tap do |req|
        req["Authorization"] = "Bearer #{@config.api_token}"
      end
    end

    def post_request(body)
      Net::HTTP::Post.new(@uri).tap do |req|
        req["Authorization"] = "Bearer #{@config.api_token}"
        req.content_type = "application/json"
        req.body = body.to_json
      end
    end
  end
end
