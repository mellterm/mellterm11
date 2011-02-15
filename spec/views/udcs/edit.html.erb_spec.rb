require 'spec_helper'

describe "udcs/edit.html.erb" do
  before(:each) do
    @udc = assign(:udc, stub_model(Udc))
  end

  it "renders the edit udc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => udc_path(@udc), :method => "post" do
    end
  end
end
