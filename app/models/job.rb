class Job < ActiveRecord::Base
  attr_accessible :code, :description, :owner_id
  
  belongs_to :provider
  has_many :terms
  
end
