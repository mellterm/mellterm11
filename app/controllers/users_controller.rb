class UsersController < ApplicationController
	
	def show
	@user = User.find(params[:id])
	@title = @user.name	
	end
	
	def new
	@user = User.new
	@title = "Sign Up"
	end
	
	def create
	@user = User.new(params[:user])
	if @user.save
		#handle a successful save
		flash[:success] = "Welcome to Mellterm!"
		redirect_to user_path(@user)
	else

	@title = "Sign Up"
	render 'new'
	end
	end
	
end
