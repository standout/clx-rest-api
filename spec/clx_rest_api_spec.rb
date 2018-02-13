RSpec.describe CLXRestAPI do
  it "has a version number" do
    expect(CLXRestAPI::VERSION).not_to be nil
  end

  describe ".configure" do
    it "saves the configuration with the provided settings" do
      CLXRestAPI.configure do |config|
        config.service_plan_id = "my_service_plan_id"
        config.api_token = "my_api_token"
      end

      expect(CLXRestAPI.config.service_plan_id).to eq "my_service_plan_id"
      expect(CLXRestAPI.config.api_token).to eq "my_api_token"
    end
  end
end
