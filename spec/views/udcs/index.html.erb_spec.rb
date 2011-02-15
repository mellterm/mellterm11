require 'spec_helper'

describe "udcs/index.html.erb" do
  before(:each) do
    assign(:udcs, [
      stub_model(Udc),
      stub_model(Udc)
    ])
  end

  it "renders a list of udcs" do
    render
  end
end
