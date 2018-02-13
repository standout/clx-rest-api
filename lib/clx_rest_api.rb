require "clx_rest_api/configuration"
require "clx_rest_api/version"
require "clx_rest_api/client"

module CLXRestAPI
  class << self
    attr_accessor :config

    def configure
      self.config ||= Configuration.new
      yield(config)
    end
  end
end
