Mellterm11::Application.routes.draw do
  
  resources :jobs

	resources :companies
	resources :documents
 	resources :sources
 	resources :translations

  	resources :currencies
  
  	resources :domains

  get "searches/new"

  get "searches/create"

  get "searches/show"
  
  
	
 	resources :sessions, :only => 	[:new, :create, :destroy]
 	resources :searches, :only =>	[:new, :create, :show]
 	resources :subscriptions, :only => [:create, :destroy]
	
	
	root :to => "pages#home"
  	
	match '/hiring', :to => 'pages#hiring' 
	match '/providers', :to => 'providers#index'
	match '/mellterm', :to => 'pages#mellterm' 
	match '/translate', :to=> 'pages#translate'
	match '/terms_and_conditions', :to => 'pages#terms_and_conditions' 
 
	match '/signup', :to => 'users#new' 
  	match '/signin', :to => 'sessions#new'
  	match '/signout', :to => 'sessions#destroy'
  	
  	match '/searches', :to => 'searches#new'
  	match '/queryresult', :to => 'searches#show'
  	match 'show_form', :to => 'terms#show_form'
	match '/translationentry', :to => 'translations#new'

  	resources :users do
		member do
			get 'subscribers'
			get 'subscribees'
		
		end
		
		
		resources :providers
  	end
  	
  	
  	resources :providers do
    		resources :translations
  		member do
      		get 'show_form'
      		
    	end
  	end

  	
  	
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs put, get, set, update to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
