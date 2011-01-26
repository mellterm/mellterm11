# == Schema Information
# Schema version: 20110125162515
#
# Table name: subscriptions
#
#  id            :integer         not null, primary key
#  subscriber_id :integer
#  subscribee_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Subscription < ActiveRecord::Base
  attr_accessible :subscribee_id
  
  belongs_to 	:subscriber, :foreign_key => "subscriber_id", :class_name => "User"
  belongs_to	:subscribee, :foreign_key => "subscribee_id", :class_name => "User"
  

  validates :subscriber_id, :presence => true
  validates :subscribee_id, :presence => true
	
  
  end
