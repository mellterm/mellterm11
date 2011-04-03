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
	
	
	TRANSLATION_TYPES = %w{term segment}
  
  	validates_inclusion_of 	:translation_type,  :in => TRANSLATION_TYPES, 
  							:message => "must be one of: #{TRANSLATION_TYPES.join(', ')}" 
	
	belongs_to :source_tu, :foreign_key => "source_id"
	belongs_to :target_tu, :foreign_key => "target_id"
	
	has_many :domain_cubes
	has_many :domains, :through => :domain_cubes
	
  	belongs_to :document
  
 	belongs_to :source
  	belongs_to :company				#context info
  	belongs_to :provider			#user.provider.translation
  	belongs_to :user				
	
end
