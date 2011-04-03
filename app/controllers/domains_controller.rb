class DomainsController < ApplicationController

	def index
		@domains = Domain.paginate(:page => params[:page])
  	end

  	def show
  		@domain = Domain.find(params[:id])
		@title = @domain.long_name
		@domain_terms = @domain.terms.paginate(:page => params[:page])
  	end
  
  	def new
		@domain = Domain.new
	end
	
	def edit
    	@domain = Domain.find(params[:id])
 	 end
	
	def create
    	@domain = Domain.new(params[:domain])

      	if @domain.save
       	 redirect_to(@domain, :notice => 'domain was successfully created.') 
    	else
        	render :action => "new"
      	end
	end
	
  	def update
    	@domain = Domain.find(params[:id])


      	if @domain.update_attributes(params[:domain])
      		flash[:success] = "Domain was successfully updated"
			redirect_to domain_path(@domain)
      	
      	else
			render :action => "edit"  
    	end
  	end



  	def destroy
    	@domain = Domain.find(params[:id])
    	@domain.destroy

   		redirect_to(domains_url) 
 	end	
	

end
