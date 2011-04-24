# == Schema Information
# Schema version: 20110201031241
#
# Table name: sources
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  is_public   :boolean
#  url         :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Source < ActiveRecord::Base
	
	attr_accessible :name, :description, :is_public, :url
	
	has_many :translations
	

end
