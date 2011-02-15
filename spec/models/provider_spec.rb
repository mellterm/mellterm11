require 'spec_helper'

describe Provider do
			
	before(:each) do
		@user = Factory(:user)
		@attr = { 	
				:name => "new Provider", 
				:source_language_id => 1,
				:target_language_id => 1,
				:notes => "instructions",
				:default_domain_id => 1,	
			    :default_is_query => false,
			    :default_is_public => false,	 
				:default_source_id => 1
	   		}
	   
	end
	
	it "should create a new instance given valid attributes" do
		@user.providers.create!(@attr)
	end
	
	describe "user associations" do
		before(:each) do
			@provider = @user.providers.create(@attr)
		end
				
		it "should have a user attribute" do
			@provider.should respond_to(:user)
		end
		
		
		it "should have the right associated user" do
			@provider.user_id.should == @user.id
			@provider.user.should == @user
		end
	end
	
	describe "validations" do

		it "should require a user id" do
			Provider.new(@attr).should_not be_valid
		end

		it "should require nonblank name" do
			@user.providers.build(:name => " ").should_not be_valid
		end
		
end
	
	
	
end