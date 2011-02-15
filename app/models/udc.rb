# == Schema Information
# Schema version: 20110215022046
#
# Table name: udcs
#
#  id              :integer         not null, primary key
#  code            :string(255)
#  default_udc_txt :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Udc < ActiveRecord::Base
	has_many :providers
end
