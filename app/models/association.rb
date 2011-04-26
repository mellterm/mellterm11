# == Schema Information
# Schema version: 20110426073702
#
# Table name: associations
#
#  id                  :integer         not null, primary key
#  associable_id       :integer
#  associable_type     :string(255)
#  conceptId           :integer
#  association_type_id :integer
#

class Association < ActiveRecord::Base
	
	belongs_to :associable, :polymorphic => true
	
	belongs_to :association_type
	
	
	attr_accessible :conceptid, :associable_id, :associable_type
	
	

end
