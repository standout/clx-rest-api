require 'spec_helper'

module CLXRestAPI
  RSpec.describe URIInterpretation do
    describe '#to_s' do
      it 'returns the uri as a string with the service plan id' do
        uri = URIInterpretation.new('/mama', nil).to_s
        expected_uri = "https://api.clxcommunications.com/xms/v1/my_service_plan_id/mama"

        expect(uri).to eq expected_uri
      end

      it 'fetches info from the params' do
        param_receiver = OpenStruct.new(encoded: 'JgL1-Xv9zGt_dY8J3')
        uri = URIInterpretation.new('/papa/:encoded/food', param_receiver).to_s
        expected_uri = "https://api.clxcommunications.com/xms/v1/my_service_plan_id/papa/JgL1-Xv9zGt_dY8J3/food"

        expect(uri).to eq expected_uri
      end
    end
  end
end
