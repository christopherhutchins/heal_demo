#Test for the cong.json

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

#ajs_anonymous_id=%22077be65e-692d-451d-a119-17f6a469e8ac%22; __qca=P0-1402654467-1493403670772; _hjIncludedInSample=1; JSESSIONID=BA3660C3E611A00076DBD402DB4B0016; ajs_user_id=null; ajs_group_id=null; _ga=GA1.2.267985184.1493403670; _gid=GA1.2.1435132478.1493503852; Uugp13AGm0RH6Lb=eyJraWQiOiIxVVFKRFVQM1lIQlhRWE9PNjVXOUFXQ1dYIiwic3R0IjoiYWNjZXNzIiwiYWxnIjoiSFMyNTYifQ.eyJqdGkiOiI3ak9mZHV3eUxGenZNR0ZrZURYcTV5IiwiaWF0IjoxNDkzNTA2MTIxLCJpc3MiOiJodHRwczovL3NwLmhlYWwuY29tL3YxL2FwcGxpY2F0aW9ucy8xcUNSMWpxWktFcWNCY3B5UVhoN1FqIiwic3ViIjoiaHR0cHM6Ly9zcC5oZWFsLmNvbS92MS9hY2NvdW50cy83aXhYcENYZXhNUVhHUkRXRVFlV01qIiwiZXhwIjoxNDkzNTc4MTIxLCJydGkiOiI3ak9mZHJjdFFmZ3dqUjl0UnhnWlR1In0.tuSqzl3ApI3TjlGaNlSYiBWYvO-X219bQDYCl1o4vE8; refresh_token=eyJraWQiOiIxVVFKRFVQM1lIQlhRWE9PNjVXOUFXQ1dYIiwic3R0IjoicmVmcmVzaCIsImFsZyI6IkhTMjU2In0.eyJqdGkiOiI3ak9mZHJjdFFmZ3dqUjl0UnhnWlR1IiwiaWF0IjoxNDkzNTA2MTIxLCJpc3MiOiJodHRwczovL3NwLmhlYWwuY29tL3YxL2FwcGxpY2F0aW9ucy8xcUNSMWpxWktFcWNCY3B5UVhoN1FqIiwic3ViIjoiaHR0cHM6Ly9zcC5oZWFsLmNvbS92MS9hY2NvdW50cy83aXhYcENYZXhNUVhHUkRXRVFlV01qIiwiZXhwIjoxNDk4NjkwMTIxfQ.4bIgqscWPZ-7Ze35ZYR0KX-4BpGjxg0etWgHdZNjgmY; _gat_secondTracker=1; SESSION=4bc6a994-9001-4267-a1bc-ff60bb716861
