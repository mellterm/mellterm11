# == Schema Information
# Schema version: 20110218172144
#
# Table name: tus
#
#  id          :integer         not null, primary key
#  content     :string(255)
#  language_id :integer
#  definition  :string(255)
#  is_source   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Tu < ActiveRecord::Base
	#tus are words in different languages which are assigned to each other as Term_Translations.
	#tus are only created indirectly via the Create Translation form
	attr_accessible :content, :language_id, :definition, :is_source
	

	has_and_belongs_to_many :terms
				
	
	validates :content,  			:presence => true,
									:length => {:minimum => 2}
	validates :language_id, 		:presence => true									
end
