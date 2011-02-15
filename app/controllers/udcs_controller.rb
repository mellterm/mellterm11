class UdcsController < ApplicationController
  # GET /udcs
  # GET /udcs.xml
  def index
    @udcs = Udc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @udcs }
    end
  end

  # GET /udcs/1
  # GET /udcs/1.xml
  def show
    @udc = Udc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @udc }
    end
  end

  # GET /udcs/new
  # GET /udcs/new.xml
  def new
    @udc = Udc.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @udc }
    end
  end

  # GET /udcs/1/edit
  def edit
    @udc = Udc.find(params[:id])
  end

  # POST /udcs
  # POST /udcs.xml
  def create
    @udc = Udc.new(params[:udc])

    respond_to do |format|
      if @udc.save
        format.html { redirect_to(@udc, :notice => 'Udc was successfully created.') }
        format.xml  { render :xml => @udc, :status => :created, :location => @udc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @udc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /udcs/1
  # PUT /udcs/1.xml
  def update
    @udc = Udc.find(params[:id])

    respond_to do |format|
      if @udc.update_attributes(params[:udc])
        format.html { redirect_to(@udc, :notice => 'Udc was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @udc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /udcs/1
  # DELETE /udcs/1.xml
  def destroy
    @udc = Udc.find(params[:id])
    @udc.destroy

    respond_to do |format|
      format.html { redirect_to(udcs_url) }
      format.xml  { head :ok }
    end
  end
end
