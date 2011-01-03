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
end
