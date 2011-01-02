require 'spec_helper'

describe "LayoutLinks" do

it "should have a Home page at '/'" do
	get '/'
	response.should have_selector('title', :content => "Home")
  end
  
  it "should have an About page at '/about'" do
	get '/about'
	response.should have_selector('title', :content => "About" )  
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
  

end
