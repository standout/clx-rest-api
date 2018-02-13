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

        client.send_batch_message(request_body)

        expect(WebMock).to have_requested(:post, uri)
                          .with(body: request_body.to_json)
      end
    end
  end
end
