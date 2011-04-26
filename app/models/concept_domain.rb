# == Schema Information
# Schema version: 20110426073439
#
# Table name: concept_domains
#
#  id         :integer         not null, primary key
#  concept_id :integer
#  domain_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class ConceptDomain < ActiveRecord::Base
end
