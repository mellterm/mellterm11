class TermsController < ApplicationController
	
	before_filter :authenticate
	
	def create
		@term = current_user.terms.build(params[:term])
		if @term.save
			flash[:success] = "Term successfully created!"
			redirect_to root_path
		else	
			render 'pages/home'
		end
	end
	
	def destroy
		
		
	end
	
	def update
		
		
		
	end
end