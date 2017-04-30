#Test for the config.json

require 'spec_helper'

describe "Config.json" do
  let(:response) { HTTParty.get('https://patient.heal.com/app/config.json').parsed_response }

  describe "Response body" do
    it "has title" do
      expect(response['title']).to eql "PROD"
    end

    it "has api url" do
      expect(response['api_url']).to eql "/api"
    end

    it "has segment key" do
      expect(response['segment_key']).to be_kind_of String
    end

    it "has ga_tracking_id" do
      expect(response['ga_tracking_id']).to be_kind_of String
    end

    it "has domain url" do
      expect(response['ga_cross_domain_url']).to eql "patient.heal.com"
    end

    it "has auth client id" do
      expect(response['auth_client_id']).to be_kind_of String
    end
  end
end
