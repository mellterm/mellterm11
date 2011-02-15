require "spec_helper"

describe UdcsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/udcs" }.should route_to(:controller => "udcs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/udcs/new" }.should route_to(:controller => "udcs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/udcs/1" }.should route_to(:controller => "udcs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/udcs/1/edit" }.should route_to(:controller => "udcs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/udcs" }.should route_to(:controller => "udcs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/udcs/1" }.should route_to(:controller => "udcs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/udcs/1" }.should route_to(:controller => "udcs", :action => "destroy", :id => "1")
    end

  end
end
