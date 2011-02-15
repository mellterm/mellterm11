# == Schema Information
# Schema version: 20110215011943
#
# Table name: providers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  source_language_id :integer
#  target_language_id :integer
#  notes              :text
#  default_domain_id  :integer
#  default_is_query   :boolean
#  default_is_public  :boolean
#  default_source_id  :integer
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image              :string(255)
#  default_udc_id     :integer
#  default_source_url :string(255)


class Provider < ActiveRecord::Base
	
	attr_accessible :name, :source_language_id, :target_language_id, :notes, 
	:default_domain_id, :default_is_public, :default_source_id, :default_is_query,
	:default_source_url, :default_udc_id, :image
	
	belongs_to :user
	belongs_to :language
	belongs_to :domain
	belongs_to :udc
	belongs_to :source
	
	has_many :jobs
	
	validates :name, :presence => true
	validates :user_id, :presence => true
	
	
	
	default_scope :order => 'providers.default_domain_id ASC'
	
end
