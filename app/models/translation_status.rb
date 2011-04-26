# == Schema Information
# Schema version: 20110426073439
#
# Table name: translation_statuses
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TranslationStatus < ActiveRecord::Base
	
	has_many :new_translations
	
	
end
