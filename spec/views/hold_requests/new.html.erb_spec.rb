require 'rails_helper'

RSpec.describe "hold_requests/new", type: :view do
  before(:each) do
    assign(:hold_request, HoldRequest.new())
  end

  it "renders new hold_request form" do
    render

    assert_select "form[action=?][method=?]", hold_requests_path, "post" do
    end
  end
end
