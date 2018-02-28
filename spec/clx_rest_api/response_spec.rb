require "clx_rest_api/response"
require "spec_helper"

module CLXRestAPI
  RSpec.describe Response do
    it "saves the original response" do
      original_response = double("HTTPOK")

      response = Response.new(original_response)

      expect(response.original_response).to eq original_response
    end

    it "parses the body to json" do
      response_hash = { "barney_stinson" => "true story" }
      response_json = response_hash.to_json
      original_response = double("HTTPOK")
      allow(original_response).to receive(:body).and_return(response_json)

      response = Response.new(original_response)

      expect(response.body).to eq response_hash
    end

    it "returns an empty hash if parse error" do
      original_response = double("HTTPOK")
      allow(original_response).to receive(:body).and_return('')

      response = Response.new(original_response)

      expect(response.body).to eq({})
    end
  end
end
