# == Schema Information
#
# Table name: subscriptions
#
#  id            :integer         not null, primary key
#  subscriber_id :integer
#  subscribee_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Subscription do
	before(:each) do
		
		@subscriber = Factory(:user)
		@subscribee = Factory(:user, :email => "someone@anywhere.com")
		@attr = {:subscribee_id => @subscribee.id}
		
		
	end

		it "should create a new instance given valid attributes" do
  		@subscriber.subscriptions.create!(@attr)
		end
		

		
	describe "subscriptions" do
	
		before(:each) do
			@subscription = @subscriber.subscriptions.create!(@attr)
		end
	
		it "should have a subscriber attribute" do
			@subscription.should respond_to(:subscriber_id)
		end
	
		it "should have the right subscriber" do
			@subscription.subscriber.should == @subscriber
		end
	
		
		it "should have a subscribee attribute" do
			@subscription.should respond_to(:subscribee_id)
		end
	
		it "should have the right subscribee user" do
			@subscription.subscribee.should == @subscribee
			
		end
		
	end	
	

	describe "validations" do
		
		it "should require a subscriber id" do
			Subscription.new(@attr).should_not be_valid
		end
		
		it "should require a subscribee id" do
			@subscriber.subscriptions.build.should_not be_valid
		end
		
	end
	
end
