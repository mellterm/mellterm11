# == Schema Information
#
# Table name: searches
#
#  id                 :integer         not null, primary key
#  source_content     :string(255)
#  target_content     :string(255)
#  source_language_id :integer
#  target_language_id :integer
#  domain_id          :integer
#  is_public          :boolean
#  is_query           :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  job_id             :integer
#

require 'spec_helper'

describe Search do
 
end
