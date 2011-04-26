# == Schema Information
# Schema version: 20110426072431
#
# Table name: new_translations
#
#  id                    :integer         not null, primary key
#  language_id           :integer
#  conceptId             :integer
#  content               :string(255)
#  is_source             :boolean
#  created_by_id         :integer
#  last_updated_by_id    :integer
#  term_type             :string(255)
#  part_of_speech        :string(255)
#  translation_status_id :integer
#  comments              :string(255)
#  source_id             :integer
#  provider_id           :integer
#  company_id            :integer
#  is_public             :boolean
#  created_at            :datetime
#  updated_at            :datetime
#

class NewTranslation < ActiveRecord::Base
	
	attr_accessible :content, :is_source, :term_type, :part_of_speech, :translation_status_id, :comments, :source_id, :company_id, :is_public
	
	has_many :concept_domains
	has_many :domains, :through => :concept_domains
	
	belongs_to :language
	
	belongs_to :provider
	belongs_to :source
	belongs_to :company
	belongs_to :created_by, :class_name => :user, :foreign_key => :created_by_id
	belongs_to :last_updated_by, :class_name => :user, :foreign_key => last_updated_by_id
	belongs_to :translation_status
	
	accepts_nested_attributes_for :source, :concept_domain, :translation_status_id 
	
	validates_inclusion_of :term_type, :in => ['term', 'segment', 'synonym', 'abbreviation'], :message=> "Please choose from term (default), segment, synonym, abbreviation"
	
	validates_inclusion_of :part_of_speech => ['noun', 'adjective', 'verb', 'adverb'], :message => "Please choose from noun (default), adjective, synonym, abbreviation"
	 
	
end
