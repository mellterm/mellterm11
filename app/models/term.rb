# == Schema Information
#
# Table name: terms
#
#  id                :integer         not null, primary key
#  source_content    :string(255)
#  source_context    :string(255)
#  target_content    :string(255)
#  target_variant    :string(255)
#  job_id            :integer
#  source_id         :integer
#  comments          :string(255)
#  created_by_id     :integer
#  approved_by_id    :integer
#  term_type_id      :integer
#  is_query          :boolean
#  is_query_question :string(255)
#  is_query_answer   :string(255)
#  is_public         :boolean
#  created_at        :datetime
#  updated_at        :datetime
#

class Term < ActiveRecord::Base
  
  belongs_to :job
  belongs_to :source
  belongs_to :created_by, :class_name => 'User'
  belongs_to :approved_by, :class_name => 'User'
  belongs_to :term_type
end
