class PagesController < ApplicationController
  def home
  	@title = "Home"
  	if signed_in?
  		@term = Term.new
  		@feed_items = current_user.feed.paginate(:page => params[:page])
  	end 
  end

  
  def about
  	@title = "About"
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
