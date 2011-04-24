require 'spec_helper'

describe ProvidersController do
	render_views

	
	describe "access control" do
			
			it "should deny access" do
				get 'index'
				response.should redirect_to(signin_path)
			end
				
			it "should deny access to 'destroy'" do
				delete 'destroy', :id => 1
				response.should redirect_to(signin_path)
			end
			
	end
		
	describe "POST 'create'" do
		
		
			before(:each) do
				@user = test_sign_in(Factory(:user, :email => "test@sample.com"))
			end
		
			describe "failure" do
			
				#bad provider only name, user must be logged in need a user id
				before (:each) do
					@attr = { 	
					:name => "    "
		   		}
				end
			
				it "should not create a provider" do
					lambda do
					post 'create', :provider => @attr
				end.should_not change(Provider, :count)
				end
			
				it "should re-render the homepage" do	
					post 'create', :provider => @attr
					response.should render_template('new')
				end	
				
				
			end
			
			describe "success" do
			
				before(:each) do
					@attr = { 
						:name => "My Provider" }
				end

				it "should create a provider" do
					lambda do
						post 'create', :provider => @attr
				end.should change(Provider, :count).by(1)
				end
				
			end
			
			
	end
	
	describe "GET 'show'" do
		
		before(:each) do
			@user = Factory(:user)
			test_sign_in(@user)
			Factory(:language, :code => "de_de", :long_name=> "German")
			Factory(:language, :code => "en_gb", :long_name=> "English")
			@provider = Factory(:provider, :user => @user, 
								:provider_name => "I am a Provider",
								:provider_descripion => "I collect terms for Automotive in German and English" 
								:source_language_id => 1,
								:target_language_id => 2,
								:default_source_id => 1)
		end
		
		it "should be successful" do
			get :show, :id => @provider.id  
			response.should be_success
		end
		
		
		it "should have a link to create new term page" do
			get :show, :id=>@provider.id
			response.should have_selector('a', :content => "Create a new term" ) 
		end
	
	
		it "should render a form to create a translation" do
			get :show, :id=>@provider.id
			render("shared/_translation_form"), :locals => {:translation => @translation}
			response.should have_selector("form[method=post]"), :action => provider_translations.path do
				|form| 
				form.should have_selector("input[type=submit]")
			end
		end	
		
		
		
			
		
	end #end show	
	
	
	
	
	
	describe "DELETE 'destroy'" do

		describe "for an unauthorized user" do
		
				before(:each) do
					@user = Factory(:user)
					wrong_user = Factory(:user, :email => Factory.next(:email))
					test_sign_in(wrong_user)
					@provider = Factory(:provider, :user => @user)
				end
				
			it "should deny access" do
				delete :destroy, :id => @provider
				response.should redirect_to(root_path)
			end
		end
			
		describe "for an authorized user" do
				
				before(:each) do
					@user = test_sign_in(Factory(:user))
					@provider = Factory(:provider, :user => @user)
				end
				
				it "should destroy the provider" do
					lambda do
					delete :destroy, :id => @provider
					flash[:success].should =~ /Provider was successfuly deleted/
					response.should redirect_to(providers_path)
				end.should change(Provider, :count).by(-1)
				end
					
		end
		
		
	end
	
end