require 'spec_helper'

describe Term do

	before(:each) do
		@user = Factory(:user)
		@attr = { 	
				:source_content => "Irgendetwas", 
			   	:target_content => "something or another", 
			   	:source_language_id => 1,
			   	:target_language_id => 2	
	   		}
	end


		it "should create a new instance given valid attributes" do
  			@user.terms.create!(@attr)
  		end
 

	describe "user associations" do
		
		before(:each) do
			@term = @user.terms.create!(@attr)	
		end
	
		it "should have a user attribute" do
			@term.should respond_to(:user) 
		end
		
		it "should have the right associated user" do
		
			@term.user_id.should == @user.id
			@term.user.should == @user			
			
		end
		
	end
	

end
