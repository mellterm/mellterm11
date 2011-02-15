require 'spec_helper'

describe "udcs/new.html.erb" do
  before(:each) do
    assign(:udc, stub_model(Udc).as_new_record)
  end

  it "renders new udc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => udcs_path, :method => "post" do
    end
  end
end
