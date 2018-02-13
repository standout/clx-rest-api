module CLXRestAPI
  class Response
    attr_reader :original_response

    def initialize(original_response)
      @original_response = original_response
    end

    def body
      JSON.parse(@original_response.body)
    end
  end
end
