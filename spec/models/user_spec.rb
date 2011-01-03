require 'spec_helper'
#rake db:test:prepare beforehand 

describe User do
	
	before(:each) do
	@attr = { 	:name => "Example User", 
			   	:email => "user@example.com", 
			   	:phone => "023-476-292",
			   	:skype => "blankskype",
			   	:time_zone => "UTC+2",
			   	:notes => "instructions",
			   	:rate => 0.08,
			   	:password =>"foobar",
			   	:password_confirmation =>"foobar"
	   		}
	end
	
	
 	it "should create a new instance given a valid attribute" do
  	User.create!(@attr)
  	end
  	
	it 'should require a name' do
	no_name_user = User.new(@attr.merge(:name=>""))
  	no_name_user.should_not be_valid
	end
  		
	it 'should require an email address' do
	no_email_user = User.new(@attr.merge(:email=>""))
	no_email_user.should_not be_valid
	end
	
	it 'should reject names that are too long' do
		long_name = "a" *25
		long_name_user = User.new(@attr.merge(:name=>long_name))
		long_name_user.should_not be_valid
	end
	
	it 'should accept valid email addresses' do
	addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
	addresses.each do |address|
		valid_email_user = User.new(@attr.merge(:email => address))
		valid_email_user.should be_valid
	end
	end
	
	it 'should reject invalid email addresses' do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |address|
		invalid_email_user = User.new(@attr.merge(:email => address))
		invalid_email_user.should_not be_valid
	end
	end
	
	it 'should reject invalid phone numbers' do
		numbers = %w[hjhhhhhhhh 8219292h291]
		numbers.each do |number|
		invalid_phone_user = User.new(@attr.merge(:phone => number))
		invalid_phone_user.should_not be_valid		
	end
	end
	
		it 'should reject phone numbers that are too long' do
		long_phone = "1" *16
		long_name_user = User.new(@attr.merge(:phone=>long_phone))
		long_name_user.should_not be_valid
	end
	
	it "should reject email addresses identical up to case" do
	upcased_email = @attr[:email].upcase
	User.create!(@attr.merge(:email => upcased_email))
	user_with_duplicate_email = User.new(@attr)
	user_with_duplicate_email.should_not be_valid
	end
	
	describe "passwords" do
		
		before(:each) do
			@user = User.new(@attr)
		end
		
		it "should have a password attribute" do
			@user.should respond_to(:password)
		end
	
		it "should have a password confirmation attribute" do
			@user.should respond_to(:password_confirmation)
		end
	end
		
	describe "password validations"	do
		
		it "should require a password" do
		User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
		end
	
		it "should require a matching password confirmation" do
			User.new(@attr.merge(:password_confirmation => "invalid_password")).
			should_not be_valid
		end
		
		it "should reject short passwords" do
			short = "a"*5
			hash = @attr.merge(:password => short, :password_confirmation => short)
			User.new(hash).should_not be_valid
		end
			
		it "should reject long passwords" do
			long = "a"*11
			hash = @attr.merge(:password => long, :password_confirmation => long)
			User.new(hash).should_not be_valid
		end
	end
	
	describe "password encryption" do
		
		before(:each) do
			@user = User.create!(@attr)
		end 
		
		it "should have an encrypted password attribute" do
		@user.should respond_to(:encrypted_password)
		end		
	
	end
	
end