class SessionsController < ApplicationController
  def new
  	@title = "Sign In"
  	
  end

def create
	user = User.authenticate(params[:session][:email],
							params[:session][:password])		
	if user.nil?
		#FAILURE flash.now = for this request only
		flash.now[:error] = "Invalid email/password combination"
		@title = "Sign In"
		render 'new'	
	else	
		#SUCESSSFUL signin redirect to user's show page
		sign_in user
		redirect_to user
		
	end						
end

def destroy
end

end
