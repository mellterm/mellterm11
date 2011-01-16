class PagesController < ApplicationController
  def home
  	@title = "Home"
  	if signed_in?
  	@term = Term.new
  	end 
  end

  
  def profile
  	@title = "Profile"
  end
  
  def mellterm
	@title = "Mellterm"
	end

  def terms_and_conditions
  	@title = "Terms & Conditions"
  end	
  
  def developers
  @title = "Developers"
  	
  end
  	
	
end
