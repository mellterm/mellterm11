class SourcesController < ApplicationController
  # GET /sources
  # GET /sources.xml
  def index
    @sources = Source.all
  end

  # GET /sources/1
  # GET /sources/1.xml
  def show
    @source = Source.find(params[:id])

  end

  # GET /sources/new
  # GET /sources/new.xml
  def new
    @source = Source.new

  end

  # GET /sources/1/edit
  def edit
    @source = Source.find(params[:id])
  end

  # POST /sources
  # POST /sources.xml
  def create
    @source = Source.new(params[:source])

  
      if @source.save
       	redirect_to(@source, :notice => 'Source was successfully created.') 
      else
 		render :action => "new" 
      end
  end

  # PUT /sources/1
  # PUT /sources/1.xml
  def update
    @source = Source.find(params[:id])


      if @source.update_attributes(params[:source])
      	redirect_to(@source, :notice => 'Source was successfully updated.')

      else
		render :action => "edit" 

      end
  end

  # DELETE /sources/1
  # DELETE /sources/1.xml
  def destroy
    @source = Source.find(params[:id])
    @source.destroy
	redirect_to(sources_url)
  end
end
