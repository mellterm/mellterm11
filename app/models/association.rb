# == Schema Information
# Schema version: 20110424085357
#
# Table name: associations
#
#  id              :integer         not null, primary key
#  translation_id  :integer
#  description     :string(255)
#  associable_id   :integer
#  associable_type :string(255)
#

class Association < ActiveRecord::Base
	
	belongs_to :associable, :polymorphic => true
	
	attr_accessible :description, :translation_id, :associable_id, :associable_type

end
