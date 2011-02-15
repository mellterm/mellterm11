# == Schema Information
# Schema version: 20110202103519
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
#  provider_id     :integer
#

class Job < ActiveRecord::Base
	
	belongs_to :provider
end
