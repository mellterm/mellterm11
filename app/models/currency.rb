# == Schema Information
# Schema version: 20110201003802
#
# Table name: currencies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  long_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Currency < ActiveRecord::Base
end
