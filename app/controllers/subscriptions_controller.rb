class SubscriptionsController < ApplicationController
	
	before_filter :authenticate

	
	#subscribe to
	def create
		# use raise params.inspect to check how to get user id to subscribe to
		@user = User.find(params[:subscription][:subscribee_id])
		current_user.subscribe_to!(@user)
		flash.now[:success] = "You are now subscribed to #{@user.name}"		
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
	
	#unscbscribe from
	def destroy
		@user = Subscription.find(params[:id]).subscribee
		current_user.unsubscribe_to!(@user)
		flash.now[:success] = "You are now unsubscribed from #{@user.name}"
		respond_to do |format|
			format.html { redirect_to @user }
			#automatically looks for destroy.js.erb in this controller
			format.js
		end
	end
	
	


	
end