# == Schema Information
# Schema version: 20110426090034
#
# Table name: association_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AssociationType < ActiveRecord::Base
end
