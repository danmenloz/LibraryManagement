require 'rails_helper'

RSpec.describe "hold_requests/edit", type: :view do
  before(:each) do
    @hold_request = assign(:hold_request, HoldRequest.create!())
  end

  it "renders the edit hold_request form" do
    render

    assert_select "form[action=?][method=?]", hold_request_path(@hold_request), "post" do
    end
  end
end
