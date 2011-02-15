require 'spec_helper'

describe UdcsController do

  def mock_udc(stubs={})
    (@mock_udc ||= mock_model(Udc).as_null_object).tap do |udc|
      udc.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all udcs as @udcs" do
      Udc.stub(:all) { [mock_udc] }
      get :index
      assigns(:udcs).should eq([mock_udc])
    end
  end

  describe "GET show" do
    it "assigns the requested udc as @udc" do
      Udc.stub(:find).with("37") { mock_udc }
      get :show, :id => "37"
      assigns(:udc).should be(mock_udc)
    end
  end

  describe "GET new" do
    it "assigns a new udc as @udc" do
      Udc.stub(:new) { mock_udc }
      get :new
      assigns(:udc).should be(mock_udc)
    end
  end

  describe "GET edit" do
    it "assigns the requested udc as @udc" do
      Udc.stub(:find).with("37") { mock_udc }
      get :edit, :id => "37"
      assigns(:udc).should be(mock_udc)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created udc as @udc" do
        Udc.stub(:new).with({'these' => 'params'}) { mock_udc(:save => true) }
        post :create, :udc => {'these' => 'params'}
        assigns(:udc).should be(mock_udc)
      end

      it "redirects to the created udc" do
        Udc.stub(:new) { mock_udc(:save => true) }
        post :create, :udc => {}
        response.should redirect_to(udc_url(mock_udc))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved udc as @udc" do
        Udc.stub(:new).with({'these' => 'params'}) { mock_udc(:save => false) }
        post :create, :udc => {'these' => 'params'}
        assigns(:udc).should be(mock_udc)
      end

      it "re-renders the 'new' template" do
        Udc.stub(:new) { mock_udc(:save => false) }
        post :create, :udc => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested udc" do
        Udc.should_receive(:find).with("37") { mock_udc }
        mock_udc.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :udc => {'these' => 'params'}
      end

      it "assigns the requested udc as @udc" do
        Udc.stub(:find) { mock_udc(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:udc).should be(mock_udc)
      end

      it "redirects to the udc" do
        Udc.stub(:find) { mock_udc(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(udc_url(mock_udc))
      end
    end

    describe "with invalid params" do
      it "assigns the udc as @udc" do
        Udc.stub(:find) { mock_udc(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:udc).should be(mock_udc)
      end

      it "re-renders the 'edit' template" do
        Udc.stub(:find) { mock_udc(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested udc" do
      Udc.should_receive(:find).with("37") { mock_udc }
      mock_udc.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the udcs list" do
      Udc.stub(:find) { mock_udc }
      delete :destroy, :id => "1"
      response.should redirect_to(udcs_url)
    end
  end

end
