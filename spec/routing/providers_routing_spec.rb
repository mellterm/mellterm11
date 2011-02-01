require "spec_helper"

describe ProvidersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/providers" }.should route_to(:controller => "providers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/providers/new" }.should route_to(:controller => "providers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/providers/1" }.should route_to(:controller => "providers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/providers/1/edit" }.should route_to(:controller => "providers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/providers" }.should route_to(:controller => "providers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/providers/1" }.should route_to(:controller => "providers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/providers/1" }.should route_to(:controller => "providers", :action => "destroy", :id => "1")
    end

  end
end
