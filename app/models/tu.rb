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
end
