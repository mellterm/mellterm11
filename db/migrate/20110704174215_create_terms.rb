class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :source_content
      t.string :source_context
      t.string :target_content
      t.string :target_variant
      t.integer :job_id
      t.integer :source_id
      t.string :comments
      t.integer :created_by_id
      t.integer :approved_by_id
      t.integer :term_type_id
      t.boolean :is_query
      t.string :is_query_question
      t.string :is_query_answer
      t.boolean :is_public

      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
