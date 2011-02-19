# == Schema Information
# Schema version: 20110218173654
#
# Table name: translation_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TranslationType < ActiveRecord::Base
end
