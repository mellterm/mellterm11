class TermsController < ApplicationController
	
	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy
	
	
		def index
			#@terms = Term.find(:all)
			#@terms = Term.paginate(:page => params[:page])
		
			@search = Term.search(params[:search])
			@terms = @search.all
			@terms = Term.paginate(:page => params[:page])
		
		end
	
		def show
			@term = Term.find(params[:id])
		
		end
	
		def new
			@term=  current_user.terms.new
			#@source_tu = @term.source_tu.build
			#@target_tu = @term.target_tu.build
			3.times {@term.domains.build}
						
		end	
	
		def create
			@term = current_user.terms.build(params[:term])
			@source_tu = @term.source_tu.create(params[:term][:source_tu])
			@target_tu = @term.target_tu.create(params[:term][:target_tu])
			
			
			if @term.valid? & @source_tu.valid? & @target_tu.valid?
				Term.transaction do
					@term.save
					@source_tu.save
					@target_tu.save
					flash[:success] = "Term successfully created!"
					redirect_to root_path
				end
			else	
				flash[:error] = "Not created"
				@feed_items = []
				render 'pages/home'
			end
		end
		
		def edit
   			@term = Term.find(params[:id])
  		end
		
	
		def update
    		@term = Term.find(params[:id])
    		if @term.update_attributes(params[:term])
      			redirect_to @term
				flash[:success] = "Term updated successfully."
    		else
      			render :action => 'edit'
    		end
  		end	
		
		
	def destroy
		@term = Term.find(params[:id])
		@term.destroy
		redirect_to root_path
		
	end
	
	#TODO AJAXIFY 
	def show_form
 		if request.xhr?
  			render 'show_form.js.erb', :layout => false
  		else
  			redirect_to root_path	
		end	 
	end
	

		
	private
	
	def authorized_user
		@term = Term.find(params[:id])
		flash[:success] = "Term deleted successfully."
		redirect_to root_path unless current_user?(@term.user) 
	end

	
	
	
end