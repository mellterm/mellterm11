# == Schema Information
# Schema version: 20110201010643
#
# Table name: jobs
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  company_id      :integer
#  invoiced_amount :float
#  currency_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Job < ActiveRecord::Base
end
