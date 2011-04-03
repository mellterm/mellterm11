# == Schema Information
# Schema version: 20110403043729
#
# Table name: documents
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  document_type :string(255)
#  user_id       :integer
#  provider_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Document < ActiveRecord::Base
	
	has_many :translations
	
	belongs_to :user
	belongs_to :provider
	
	DOCUMENT_TYPES = %w{memory glossary sourcedoc reference}
	
	
	validates_inclusion_of 	:document_type,  :in => DOCUMENT_TYPES, 
  								:message => "must be one of: #{DOCUMENT_TYPES.join(', ')}" 
	

	
	
end
