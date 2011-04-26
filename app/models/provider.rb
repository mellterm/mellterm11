# == Schema Information
# Schema version: 20110403043729
#
# Table name: providers
#
#  id                 :integer         not null, primary key
#  provider_name      :string(255)
#  description        :string(255)
#  source_language_id :integer
#  target_language_id :integer
#  default_domain_id  :integer
#  default_is_public  :boolean
#  default_source_id  :integer
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#


class Provider < ActiveRecord::Base
	
	attr_accessible :provider_name, :description, :source_language_id, :target_language_id, 
	:default_domain_id, :default_is_public, :default_source_id
	
	
	has_many :documents 
  	belongs_to :user
  	
  	belongs_to :source_language, :foreign_key => :source_language_id 
  	belongs_to :target_language, :foreign_key => :target_language_id
  	
  	belongs_to :domain, :foreign_key => :default_domain_id, :dependent => :destroy
  	
  	belongs_to :source, :foreign_key => :default_source_id
  	has_many :translations, :dependent => :destroy
	has_many :new_translations
	
	
	validates :provider_name, :presence => true
	validates :user_id, :presence => true
	
	
	
	default_scope :order => 'providers.default_domain_id ASC'
	
end
