require 'spec_helper'

describe "LayoutLinks" do

it "should have a Home page at '/'" do
	get '/'
	response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Developers page at '/developers'" do
	get '/developers'
	response.should have_selector('title', :content => "Developers" )  
  end  
  
  it "should have an About page at '/profile'" do
	get '/profile'
	response.should have_selector('title', :content => "About" )  
  end  
  
  it "should have a link to Mellterm page at '/mellterm'" do
	get '/mellterm'
	response.should have_selector('title', :content => "Mellterm" )  
  end  
  
it "should have a Terms and Conditions page at '/terms_and_conditions'" do
	get '/terms_and_conditions'
	response.should have_selector('title', :content => "Terms & Conditions" )  
  end
  
it "should have a signup page at '/signup'" do
	get '/signup'
	response.should have_selector('title', :content => "Sign Up" )  
end

it "should have a signin page at '/signin'" do
	get '/signin'
	response.should have_selector('title', :content => "Sign In" )  
end



it "should have the right links on the layout" do
	visit root_path
	response.should have_selector('title', :content => "Home" )
	click_link "Developers"
	response.should have_selector('title', :content => "Developers" )
	click_link "About"
	response.should have_selector('title', :content => "About" )
	click_link "Home"
	response.should have_selector('title', :content => "Home" )
	click_link "Sign Up Now"
	response.should have_selector('title', :content => "Sign Up" )   
end

	describe "layout links when not signed in" do
		it "should have a sign in link" do
		visit root_path
		response.should have_selector("a", :href=> signin_path, :content=> "Sign In")
		
	end	
	end
	
	describe "layout links when signed in" do
	
		before(:each) do
		@user = Factory(:user)
		visit signin_path
		fill_in "email", 	:with => @user.email
		fill_in "password", :with => @user.password
		click_button
		end
		
		it "should have a signout link" do
			visit root_path
			response.should have_selector("a", :href=> signout_path, :content=> "Sign Out")
		end
		
		it "should have a profile link" do
			visit root_path
			response.should have_selector("a", 	:href => user_path(@user),
												:content => "My Profile")
		end
		
		it "should have a users path" do
			visit root_path
			response.should have_selector("a", 	:href => users_path,
												:content => "Users") 
		end
		
	end
	
	
end
