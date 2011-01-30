require 'spec_helper'

describe SubscriptionsController do
	
	describe "access control" do
		
		it "should require signin for create" do
			post :create
			response.should redirect_to(signin_path) 
		end	
	
	
			it "should require signin for delete" do
			post :create, :id=> 1
			response.should redirect_to(signin_path) 
			end
	end
		
	describe "POST 'create'" do
			
		describe "create when user has enough credit" do
			
			before(:each) do
				@user = test_sign_in(Factory(:user))
				@subscribee = Factory(:user, :email => Factory.next(:email))
			end	
		
			it "should create a subscription" do
				lambda do
				post :create, :subscription => { :subscribee_id => @subscribee }
				response.should be_redirect
				end.should change(Subscription, :count).by(1)
			end
		
			it "should create a subscription with AJAX" do
			lambda do
				xhr :post, :create, :subscription => { :subscribee_id => @subscribee }
				response.should be_success
				response.should change(Subscription, :count).by(1)
			end
			end
		end
	
		
	end
	
	describe "DELETE 'destroy'" do
	
		before(:each) do
			@user = test_sign_in(Factory(:user))
			@subscribed = Factory(:user, :email => Factory.next(:email))
			@user.subscribe_to!(@subscribed)
			@subscription = @user.subscriptions.find_by_subscribee_id(@subscribed)
		end
	
		it "should destroy a subscription" do
			lambda do
				delete :destroy, :id => @subscription
				response.should be_redirect
			end.should change(Subscription, :count).by(-1)
		end
	
		it "should destroy a subscription with AJAX" do
			lambda do
				xhr :delete, :destroy, :id => @subscription
				response.should be_success
				response.should change(Subscription, :count).by(-1)
		end
		end
		
	end
		
	
end	