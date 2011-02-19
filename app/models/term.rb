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
	attr_accessible :source_content, :target_content, :source_language_id,:target_language_id, :domain_id, :notes, :source, :is_query, :is_public
	
	belongs_to :user
	belongs_to :language
	belongs_to :domain

	
	validates_presence_of :source_language_id, :target_language_id, :domain_id, :user_id
	
	validates :source_content,  	:presence => true,
									:length => {:minimum => 2}
									
									
	validates :target_content,  	:presence => true,
									:length => {:minimum => 2}
																								
	default_scope :order => 'terms.created_at DESC'
end
