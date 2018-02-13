require "clx_rest_api/base_uri"

module CLXRestAPI
  class URIInterpretation
    def initialize(uri, param_receiver, config: CLXRestAPI.config)
      @service_plan_id = config.service_plan_id
      @param_receiver = param_receiver
      @uri = uri
    end

    def to_s
      suffix = @uri.gsub(param_regex) {|param| retrieve_param(param) }
      "#{CLXRestAPI::BASE_URI}/xms/v1/#{@service_plan_id}#{suffix}"
    end

    private

    def param_regex
      /(?<=\/):(\w*)/
    end

    def retrieve_param(param)
      @param_receiver[param[/\w+/]]
    end
  end
end
