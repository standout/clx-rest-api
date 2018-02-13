module CLXRestAPI
  class Configuration
    attr_accessor :service_plan_id, :api_token

    def initialize
      @service_plan_id = nil
      @api_token = nil
    end
  end
end
