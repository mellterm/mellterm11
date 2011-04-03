# == Schema Information
# Schema version: 20110306164706
#
# Table name: domain_cubes
#
#  id         :integer         not null, primary key
#  term_id    :integer
#  domain_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class DomainCube < ActiveRecord::Base
	
	belongs_to :translation
	belongs_to :domain
end
