# == Schema Information
#
# Table name: domains
#
#  id                 :integer         not null, primary key
#  code               :string(255)
#  long_name          :string(255)
#  image              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'spec_helper'

describe Domain do

end
