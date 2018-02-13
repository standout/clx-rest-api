require "clx_rest_api/request"
require "spec_helper"

module CLXRestAPI
  RSpec.describe Request do
    describe "#execute" do
      context "when get request" do
        it "sets the token in the header" do
          token = CLXRestAPI.config.api_token
          stub_request(:get, "https://www.example.com")
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com", method: :get).execute

          expect(WebMock).to have_requested(:get, "https://www.example.com")
                             .with(headers: { "Authorization" => "Bearer #{token}" })
        end

        it "gets the provided url" do
          stub_request(:get, "https://www.example.com")
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com", method: :get).execute

          expect(WebMock).to have_requested(:get, "https://www.example.com")
        end

        it "uses the given query parameters" do
          body = { my_body: "hello" }
          stub_request(:get, "https://www.example.com")
            .with(query: body)
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com").execute(body)

          expect(WebMock).to have_requested(:get, "https://www.example.com?my_body=hello")
        end

        it "parses the response" do
          expected_response = { "test" => "test" }
          stub_request(:get, "https://www.example.com")
            .to_return(body: expected_response.to_json)

          response = Request.new("https://www.example.com", method: :get).execute

          expect(response).to eq expected_response
        end
      end

      context "when post request" do
        it "sets the token in the header" do
          token = CLXRestAPI.config.api_token
          stub_request(:post, "https://www.example.com")
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com", method: :post).execute

          expect(WebMock).to have_requested(:post, "https://www.example.com")
                             .with(headers: { "Authorization" => "Bearer #{token}" })
        end

        it "posts to the provided url" do
          stub_request(:post, "https://www.example.com")
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com", method: :post).execute

          expect(WebMock).to have_requested(:post, "https://www.example.com")
        end

        it "uses the given body" do
          body = { my_body: "hello" }
          stub_request(:post, "https://www.example.com")
            .with(body: body.to_json)
            .to_return(body: { test: "test" }.to_json)

          Request.new("https://www.example.com", method: :post).execute(body)

          expect(WebMock).to have_requested(:post, "https://www.example.com")
                                           .with(body: body.to_json)
        end

        it "parses the response" do
          expected_response = { "test" => "test" }
          stub_request(:post, "https://www.example.com")
            .to_return(body: expected_response.to_json)

          response = Request.new("https://www.example.com", method: :post).execute

          expect(response).to eq expected_response
        end
      end
    end
  end
end
