require 'spec_helper'

describe "udcs/show.html.erb" do
  before(:each) do
    @udc = assign(:udc, stub_model(Udc))
  end

  it "renders attributes in <p>" do
    render
  end
end
