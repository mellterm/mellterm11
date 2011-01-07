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
  
  it "should have a Profile page at '/profile'" do
	get '/profile'
	response.should have_selector('title', :content => "Profile" )  
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
	click_link "Profile"
	response.should have_selector('title', :content => "Profile" )
	click_link "Home"
	response.should have_selector('title', :content => "Home" )
	click_link "Sign Up Now"
	response.should have_selector('title', :content => "Sign Up" )   
end

end
