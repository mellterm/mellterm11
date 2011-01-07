class PagesController < ApplicationController
  def home
  	@title = "Home"
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
