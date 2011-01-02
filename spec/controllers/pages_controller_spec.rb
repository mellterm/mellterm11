require 'spec_helper'

describe PagesController do
render_views

before(:each) do
	@base_title = "Mellterm Basic Job Man Application"
end

describe "GET 'home'" do
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

describe "GET 'profile'" do
    it "should be successful" do
      get 'profile'
      response.should be_success
    end

  
  	it "should have the right title" do
		get 'profile'
		response.should have_selector("title",
		:content => "#{@base_title} | Profile")
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