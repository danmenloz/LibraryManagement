require 'rails_helper'

RSpec.describe "libraries/new", type: :view do
  before(:each) do
    assign(:library, Library.new())
  end

  it "renders new library form" do
    render

    assert_select "form[action=?][method=?]", libraries_path, "post" do
    end
  end
end
