# == Schema Information
#
# Table name: associations
#
#  id                  :integer         not null, primary key
#  associable_id       :integer
#  associable_type     :string(255)
#  conceptId           :integer
#  association_type_id :integer
#

require 'spec_helper'

describe Association do
  pending "add some examples to (or delete) #{__FILE__}"
end
