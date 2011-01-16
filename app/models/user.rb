# == Schema Information
# Schema version: 20110109083719
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  phone              :string(255)
#  skype              :string(255)
#  time_zone          :string(255)
#  notes              :text
#  rate               :integer
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean
#

# == Schema Information
# Schema version: 20110103175526
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  phone              :string(255)
#  skype              :string(255)
#  time_zone          :string(255)
#  notes              :text
#  rate               :integer
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#
require 'digest'

class User < ActiveRecord::Base
	attr_accessor	:password
	attr_accessible :name, :email,:phone, :skype, :time_zone, :notes, :rate, :password, :password_confirmation 
	
	has_many :terms, :dependent => :destroy
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[1-z]+\z/i
	phone_regex = /\A[\d+\-\s]+\z/
	
	validates :name,  	:presence => true,
						:length => {:minimum => 4, :maximum => 30}
	
	validates :email, 	:presence => true,
						:format => {:with => email_regex},
						:uniqueness => { :case_sensitive => false }
						
	validates :phone, 	:presence => true,
						:length => {:minimum => 4, :maximum => 15},
						:format => {:with => phone_regex}
						
	validates :password, 	:presence => true,
							:confirmation => true,
							:length => {:within => 6..10}
							
							
	before_save :encrypt_password
	
	def has_password?(submitted_password)
		# Compare encrypted_password with the encrypted version of submitted_password.
		self.encrypted_password == encrypt(submitted_password)		
	end
	
	
	def feed
		#=? used to escape SQL
		Term.where("user_id= ?", self.id)
	end
	
	
	#class method self.authenticate is also ok
	#also ok class << self \n def authenticate
	def User.authenticate(email, submitted_password)
		user = User.find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def User.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		return nil if user.nil?
		return user if user.salt == cookie_salt
		#Also: (user && user.salt == cookie_salt) ? user:nil		
		
	end
	
	
	private
	
		def encrypt_password
			self.salt = make_salt if self.new_record?
			self.encrypted_password = encrypt(self.password)
		end						
						
		def encrypt(string)
			secure_hash("#{self.salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
	
end
