# == Schema Information
# Schema version: 20110115002018
#
# Table name: domains
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  long_name  :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Domain < ActiveRecord::Base
	has_many :domain_cubes
	has_many :providers
	has_many :terms, :through => :domain_cubes
end
