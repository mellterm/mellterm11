require 'spec_helper'

describe TermsController do
	render_views

	describe "access control" do
		
		it "should deny access to 'create'" do
			post 'create'
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
			
			before (:each) do
				@attr = { 	
				:source_content => " ", 
			   	:target_content => " ", 
			   	:source_language_id => "de-de",
			   	:target_language_id => "fr-fr",
			   	:domain_id =>"elec"
			   		
	   		}
			end
			
			
			it "should not create a term" do
				lambda do
					post 'create', :term => @attr
				end.should_not change(Term, :count)
					
			end
			
			it "should re-render the homepage" do	
				post 'create', :term => @attr
				response.should render_template('pages/home')
				
			end	
				
		end	
		
		
		describe "success" do
			
			before(:each) do
				@attr = { 
				
				:source_content => "Irgendetwas", 
			   	:target_content => "something or another", 
			   	:source_language_id => 1,
			   	:target_language_id => 2,
			   	:domain_id =>1	
		}
				 end

			it "should create a term" do
				lambda do
				post 'create', :term => @attr
				end.should change(Term, :count).by(1)
			end
				
				
			it "should redirect to the home page" do
				post 'create', :term => @attr
				response.should redirect_to(root_path)
			end
			
			it "should have a flash message" do
				post 'create', :term => @attr
				flash[:success].should =~ /term successfully created/i
			end
				
		end	
	end
	
		describe "DELETE 'destroy'" do

			describe "for an unauthorized user" do
		
				before(:each) do
					@user = Factory(:user)
					wrong_user = Factory(:user, :email => Factory.next(:email))
					test_sign_in(wrong_user)
					@term = Factory(:term, :user => @user)
				end
				
			it "should deny access" do
				delete :destroy, :id => @term
				response.should redirect_to(root_path)
			end
		end
			
			describe "for an authorized user" do
				
				before(:each) do
					@user = test_sign_in(Factory(:user))
					@term = Factory(:term, :user => @user)
				end
				
				it "should destroy the term" do
					lambda do
					delete :destroy, :id => @term
					flash[:success].should =~ /term deleted/i
					response.should redirect_to(root_path)
					end.should change(Term, :count).by(-1)
					end
					
			end
		
		
		end
end