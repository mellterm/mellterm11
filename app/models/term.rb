# == Schema Information
# Schema version: 20110115003458
#
# Table name: terms
#
#  id                 :integer         not null, primary key
#  source_content     :string(255)
#  target_content     :string(255)
#  source_language_id :integer
#  target_language_id :integer
#  domain_id          :integer
#  notes              :text
#  source             :integer
#  is_query           :boolean
#  is_public          :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#

class Term < ActiveRecord::Base
	
	attr_accessible :source_content, :target_content, :source_language_id,:target_language_id, :domain_id, :notes, :source, :is_query, :is_public
	
	belongs_to :user
	belongs_to :language
	belongs_to :domain
	
	validates_presence_of :source_language_id, :target_language_id, :domain_id, :user_id
	
	validates :source_content,  	:presence => true,
									:length => {:minimum => 2, :maximum => 40}
									
									
	validates :target_content,  	:presence => true,
									:length => {:minimum => 2, :maximum => 40}								

	default_scope :order => 'terms.created_at DESC'
end
