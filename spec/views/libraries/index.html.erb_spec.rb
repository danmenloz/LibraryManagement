require 'rails_helper'

RSpec.describe "libraries/index", type: :view do
  before(:each) do
    assign(:libraries, [
      Library.create!(),
      Library.create!()
    ])
  end

  it "renders a list of libraries" do
    render
  end
end
