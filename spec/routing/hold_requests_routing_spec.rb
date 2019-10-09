require "rails_helper"

RSpec.describe HoldRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/hold_requests").to route_to("hold_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/hold_requests/new").to route_to("hold_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/hold_requests/1").to route_to("hold_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hold_requests/1/edit").to route_to("hold_requests#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/hold_requests").to route_to("hold_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hold_requests/1").to route_to("hold_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hold_requests/1").to route_to("hold_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hold_requests/1").to route_to("hold_requests#destroy", :id => "1")
    end
  end
end
