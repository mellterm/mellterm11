class ProvidersController < ApplicationController
  # GET /providers
  # GET /providers.xml
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
    @provider = Provider.new(params[:provider])

      if @provider.save
       redirect_to(@provider, :notice => 'Provider was successfully created.') 
 
      else
        render :action => "new" 

      end

  end

  # PUT /providers/1
  # PUT /providers/1.xml
  def update
    @provider = Provider.find(params[:id])


      if @provider.update_attributes(params[:provider])
       redirect_to(@provider, :notice => 'Provider was successfully updated.')

      else
		render :action => "edit" 
   
      end

  end

  # DELETE /providers/1

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
redirect_to(providers_url) 

  end
end
