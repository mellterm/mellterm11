# == Schema Information
# Schema version: 20110403043729
#
# Table name: translations
#
#  id               :integer         not null, primary key
#  source_tu_id     :integer
#  target_tu_id     :integer
#  is_public        :boolean
#  provider_id      :integer
#  company_id       :integer
#  source_id        :integer
#  source_url       :string(255)
#  document_id      :integer
#  user_id          :integer
#  translation_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Translation < ActiveRecord::Base
	attr_accessible :source_tu_id, :is_public, :source_id, :source_url, :translation_type
	
	
	belongs_to :source_tu
	belongs_to :target_tu
	
	has_many :domain_cubes
	has_many :domains, :through => :domain_cubes
	
  	belongs_to :document
  
 	belongs_to :source
  	belongs_to :company				#context info
  	belongs_to :provider			#user.provider.translation
  	belongs_to :user				
	
  	accepts_nested_attributes_for :source_tu, :target_tu, :source 
end
