require 'rails_helper'

RSpec.describe "libraries/show", type: :view do
  before(:each) do
    @library = assign(:library, Library.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
