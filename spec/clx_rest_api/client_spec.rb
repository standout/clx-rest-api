require "spec_helper"

module CLXRestAPI
  RSpec.describe Client do
    describe ".send_batch_message" do
      it "calls the appropriate endpoint" do
        service_plan_id = CLXRestAPI.config.service_plan_id
        uri = "https://api.clxcommunications.com/xms/v1/#{service_plan_id}/batches"
        request_body = { message: "hello world" }
        client = CLXRestAPI::Client.new
        stub_request(:post, uri)
          .to_return(body: {}.to_json)

        client.send_batch_message(params: request_body)

        expect(WebMock).to have_requested(:post, uri)
                          .with(body: request_body.to_json)
      end
    end

    describe ".retrieve_delivery_report" do
      it "calls the appropriate endpoint" do
        service_plan_id = CLXRestAPI.config.service_plan_id
        uri = "https://api.clxcommunications.com/xms/v1/#{service_plan_id}/batches/110/delivery_report"
        query_params = { my_param: "Oh hi" }
        client = CLXRestAPI::Client.new
        stub_request(:get, uri)
          .with(query: query_params)
          .to_return(body: {}.to_json)

        client.retrieve_delivery_report(params: query_params, batch_id: "110")

        expect(WebMock).to have_requested(:get, uri)
                          .with(query: query_params)
      end
    end
  end
end
