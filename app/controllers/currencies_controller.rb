class CurrenciesController < ApplicationController
  # GET /currencies

  def index
    @currencies = Currency.all


  end

  # GET /currencies/1

  def show
    @currency = Currency.find(params[:id])

  end

  # GET /currencies/new
 
  def new
    @currency = Currency.new
  end

  # GET /currencies/1/edit
  def edit
    @currency = Currency.find(params[:id])
  end


  def create
    @currency = Currency.new(params[:currency])

      if @currency.save
        redirect_to(@currency, :notice => 'Currency was successfully created.') 
    	else
        render :action => "new"
      end

  end

  # PUT /currencies/1

  def update
    @currency = Currency.find(params[:id])


      	if @currency.update_attributes(params[:currency])
       		redirect_to(@currency, :notice => 'Currency was successfully updated.')

      	else
			render :action => "edit"  
    	end
  end

  # DELETE /currencies/1

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy

   redirect_to(currencies_url) 
  end
  
end
