class TermsController < ApplicationController
	
	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy
	
	def create
		@term = current_user.terms.build(params[:term])
		if @term.save
			flash[:success] = "Term successfully created!"
			redirect_to root_path
		else	
			@feed_items = []
			render 'pages/home'
		end
	end
	
	def destroy
		@term.destroy
		redirect_to root_path
		
	end
	
	def update
	
		
	end
	
	def show
		@term = Term.find(params[:id])
	end
	
	private
	
	def authorized_user
		@term = Term.find(params[:id])
		flash[:success] = "Term deleted"
		redirect_to root_path unless current_user?(@term.user) 
	end
	
end