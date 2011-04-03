class PagesController < ApplicationController
  def home
  	@title = "Home"
  	if signed_in?
  		@term = Translation.new
  		@feed_items = current_user.feed.paginate(:page => params[:page])
  	end 
  end

  
  def providers
  	@title = "Providers"
  end
  
  def search
  	@title = "Search"
  end
  
  def translate
  	@title = "Translate&About Mellterm"
  end
   
 
  def terms_and_conditions
  	@title = "Terms & Conditions"
  end	
  
  def hiring
  	@title = "Hiring Now"
  	
  end
  	
	
end
