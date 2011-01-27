class UsersController < ApplicationController
	
	#see below for filter methods
	before_filter :authenticate, :except => [:show, :new, :create]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :admin_user, :only => :destroy
	
	def index
		@title = "All users"
		@users = User.paginate(:page => params[:page])
	end
		
	def show
		@user = User.find(params[:id])
		@title = @user.name	
		@terms = @user.terms.paginate(:page => params[:page])
	
	end
	
	def subscribees
		@title = "Subscribed to"
		@user = User.find(params[:id])
		@users = @user.subscribees.paginate(:page => params[:page])
		render 'show_subs'

	end
	
	
	def subscribers
		@title = "My Subscribers"
		@user = User.find(params[:id])
		@users = @user.subscribers.paginate(:page => params[:page])
		render 'show_subs'

	end
	
	
	def new
	@user = User.new
	@title = "Sign Up"
	end
	
	def create
	@user = User.new(params[:user])
	if @user.save
		#handle a successful save
		sign_in @user
		flash[:success] = "Welcome to Mellterm!"
		redirect_to user_path(@user)
	else
		@title = "Sign Up"
		render 'new'
	end
	end
	
	def edit
	@title = "Edit user"
		
	end
	
	def update
		if @user.update_attributes(params[:user])
			flash[:success] = "Profile updated."
			redirect_to @user
		else	
			@title = "Edit user"
			render 'edit'
		end
	end
	
	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed"
		redirect_to users_path
	end
	
	private
	

	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
		user = User.find(params[:id])
		# current_user(@user) user is trying to delete himself
		redirect_to(root_path) unless current_user.admin?
	end
	
end
