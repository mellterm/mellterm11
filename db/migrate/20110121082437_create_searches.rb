class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :source_content
      t.string :target_content
      t.integer :source_language_id
      t.integer :target_language_id
      t.integer :domain_id
      t.boolean :is_public
      t.boolean :is_query
	  t.datetime :created_at
	  t.datetime :updated_at
	  t.integer :user_id
	  t.integer :job_id 	
      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end
