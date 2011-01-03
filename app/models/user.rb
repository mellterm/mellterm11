# == Schema Information
# Schema version: 20110103082404
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  skype      :string(255)
#  time_zone  :string(255)
#  notes      :text
#  rate       :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :email,:phone, :skype, :time_zone, :notes, :rate 
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[1-z]+\z/i
	phone_regex = /\A[\d+\-\s]+\z/
	
	validates :name,  	:presence => true,
						:length => {:minimum => 4, :maximum => 15}
	
	validates :email, 	:presence => true,
						:format => {:with => email_regex},
						:uniqueness => { :case_sensitive => false }
						
	validates :phone, 	:presence => true,
						:length => {:minimum => 4, :maximum => 15},
						:format => {:with => phone_regex}
end
