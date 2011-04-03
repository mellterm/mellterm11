# == Schema Information
# Schema version: 20110306164706
#
# Table name: source_tus
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  language_id :integer
#  definition  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SourceTu < ActiveRecord::Base

	attr_accessible :content, :language_id, :definition, :is_source
	
	has_many :translations
	has_many :target_tus, :through => :translations
	
	
	validates :content,  			:presence => true,
									:length => {:minimum => 2}
	validates :language_id, 		:presence => true		
	
	
end
