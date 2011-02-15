class ProvidersController < ApplicationController

	before_filter :authenticate
	before_filter :authorized_user, :only => :destroy

  # GET /providers
  def index
    @providers = Provider.all

  end

  # GET /providers/1

  def show
    @provider = Provider.find(params[:id])
  
  end

  # GET /providers/new
 
  def new
    @provider = Provider.new

  end

  # GET /providers/1/edit
  def edit
    @provider = Provider.find(params[:id])
  end

  # POST /providers
  # POST /providers.xml
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
