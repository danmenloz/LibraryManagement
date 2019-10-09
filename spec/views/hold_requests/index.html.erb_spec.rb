require 'rails_helper'

RSpec.describe "hold_requests/index", type: :view do
  before(:each) do
    assign(:hold_requests, [
      HoldRequest.create!(),
      HoldRequest.create!()
    ])
  end

  it "renders a list of hold_requests" do
    render
  end
end
