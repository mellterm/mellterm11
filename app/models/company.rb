# == Schema Information
# Schema version: 20110201004957
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  long_name  :string(255)
#  notes      :text
#  address    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
end