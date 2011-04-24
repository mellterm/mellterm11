class ProvidersController < ApplicationController

	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy

  def index
    	@providers = Provider.all
  end


  def show
  	#basic provider-specific search
  	if params[:search]
  		@stid = SourceTu.find_by_content("%#{params[:search]}%").id
  		@translations = @provider.translations.find_all_by_source_tu_id(stid)
  		@translation = @provider.translations.build
  	else		
  	    @provider = Provider.find(params[:id])
  	    @translations = @provider.translations.find(:all, :order => "created_at DESC")
  	    @title = @provider.provider_name    
   end
  end

 
  def new
    @provider = Provider.new

  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def create

	@provider= current_user.providers.build(params[:provider])
     if @provider.save
       	redirect_to(@provider) 
 		flash.now[:success] = "Provider was successfully created!"
     else
        render :action => "new" 
     end
  end

  # PUT /providers/1
  # PUT /providers/1.xml
  def update
    @provider = Provider.find(params[:id])


      if @provider.update_attributes(params[:provider])
       redirect_to(@provider, :success => 'Provider was successfully updated.')

      else
		render :action => "edit" 
 
      end

  end

  # DELETE /providers/1

  def destroy
    @provider.destroy
    flash[:success] = "Provider was successfuly deleted!"
	redirect_to providers_path

  end
   
  	def show_form
 		if request.xhr?
  			render 'show_form.js.erb', :layout => false
		end	 
	end
  
  
  
  private
  	def authenticate
		deny_access unless signed_in?
	end
  
  	def authorized_user
  		#only current user can delete own providers
		@provider = Provider.find(params[:id])
		redirect_to root_path unless current_user?(@provider.user)
	end
  
  
end
