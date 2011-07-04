# == Schema Information
# Schema version: 20110115002018
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  long_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Language < ActiveRecord::Base
			
end
