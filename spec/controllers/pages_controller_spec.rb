require 'spec_helper'

describe PagesController do
render_views

before(:each) do
	@base_title = "Mellterm Translation and Terminology"
end

describe "GET 'home'" do

	describe "when not signed in" do
	
		it "should be successful" do
			get 'home'
		response.should be_success
		end
  
		it "should have the right title" do
			get 'home'
			response.should have_selector("title",
			:content => "#{@base_title} | Home")
		end
  
		it "should have a non-blank body" do
			get 'home'
			response.body.should_not =~/<body>\s*<\/body>/
		end

	end
	
	describe "when signed in" do
	
		before(:each) do
		
			@user = test_sign_in(Factory(:user))
			other_user = Factory(:user, :email => Factory.next(:email))
			other_user.subscribe_to!(@user)
		end
	
		it "should have the right subscriber/subscribee counts" do
			get 'home'
			response.should have_selector('a', 	:href=> subscribees_user_path(@user),
												:content=> "0 subscriptions")
			response.should have_selector('a', 	:href=> subscribers_user_path(@user),
												:content=> "1 subscribed to me")									
		end
	
	end
	
	
end		

describe "GET 'developers'" do
    it "should be successful" do
      get 'developers'
      response.should be_success
    end

	it "should have the right title" do
		get 'developers'
		response.should have_selector("title",
		:content => "#{@base_title} | Developers")
	end
end

describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

  
  	it "should have the right title" do
		get 'about'
		response.should have_selector("title",
		:content => "#{@base_title} | About")
	end
end

describe "GET 'mellterm'" do
    it "should be successful" do
      get 'mellterm'
      response.should be_success
    end

  
  	it "should have the right title" do
		get 'mellterm'
		response.should have_selector("title",
		:content => "#{@base_title} | Mellterm")
	end
end

describe "GET 'mellterm'" do
    it "should be successful" do
      get 'mellterm'
      response.should be_success
    end

  
  	it "should have the right title" do
		get 'terms_and_conditions'
		response.should have_selector("title",
		:content => "#{@base_title} | Terms & Conditions")
	end
end


end