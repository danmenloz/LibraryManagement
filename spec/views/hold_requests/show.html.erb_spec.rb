require 'rails_helper'

RSpec.describe "hold_requests/show", type: :view do
  before(:each) do
    @hold_request = assign(:hold_request, HoldRequest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
