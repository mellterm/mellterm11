class TranslationsController < ApplicationController
	
	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy
	
	def index
			#@terms = Term.find(:all)
			#@terms = Term.paginate(:page => params[:page])
			@translations = Translation.find(:all)
			
			
		end
	
	def show
			@translation = Translation.find(params[:id])
		end
	
	def new
		@translation= current_user.translations.new
		@source_tu = @translation.build_source_tu
		@target_tu = @translation.build_target_tu
		#3.times do {@translation.domains.build}		
						
		end
	
	def create
		@translation = current_user.translations.build(params[:translation])
		@source_tu = @translation.build_source_tu(params[:translation][:source_tu])
		@target_tu = @translation.build_target_tu(params[:translation][:target_tu])
		@source_id = @provider.default_source_id
		if @translation.valid?
				Translation.transaction do
					@translation.save
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
		
	#user.providers.find(x).translations
	
	
	private
	
	def authorized_user
		#only authorized users can delete their own terms
		@term = Term.find(params[:id])
		flash[:success] = "Term deleted successfully."
		redirect_to root_path unless current_user?(@term.user) 
	end
	
	
end
