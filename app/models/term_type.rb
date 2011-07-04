# == Schema Information
#
# Table name: term_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TermType < ActiveRecord::Base
  
  has_many :terms
  
end
