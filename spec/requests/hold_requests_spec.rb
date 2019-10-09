require 'rails_helper'

RSpec.describe "HoldRequests", type: :request do
  describe "GET /hold_requests" do
    it "works! (now write some real specs)" do
      get hold_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
