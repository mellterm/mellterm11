# == Schema Information
# Schema version: 20110403043729
#
# Table name: domain_cubes
#
#  id             :integer         not null, primary key
#  translation_id :integer
#  domain_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class DomainCube < ActiveRecord::Base
	
	belongs_to :translation
	belongs_to :domain
	
	validates_uniqueness_of :id, :scope => [:domain_id, :translation_id]
	
end
