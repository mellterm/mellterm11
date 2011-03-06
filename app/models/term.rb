# == Schema Information
# Schema version: 20110219044042
#
# Table name: terms
#
#  id                  :integer         not null, primary key
#  notes               :text
#  is_query            :boolean
#  is_public           :boolean
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  source_tu_id        :integer
#  target_tu_id        :integer
#  source_id           :integer
#  source_url          :string(255)
#  udc_id              :integer
#  translation_type_id :integer
#  definition          :string(255)
#

class Term < ActiveRecord::Base
	#deprecated- will be replaced by or amended into Term_Translations
	attr_accessible  	:notes, :is_query, :is_public, :source_tu_id, 
						:target_tu_id, :source_url, :source_id, :udc_id, :translation_type_id, :definition
	
	belongs_to :user
	belongs_to :udc
	belongs_to :source
	belongs_to :translation_type

	belongs_to :source_tu
	belongs_to :target_tu
	
	has_many :domain_cubes
	has_many :domains, :through => :domain_cubes
	
	
	validates_presence_of :user_id
	

																								
	default_scope :order => 'terms.created_at DESC'
end
