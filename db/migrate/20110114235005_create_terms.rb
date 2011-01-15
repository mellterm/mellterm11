class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :source_content
      t.string :target_content
      t.integer :source_language_id
      t.integer :target_language_id
      t.integer :domain_id
      t.text :notes
      t.integer :source
      t.boolean :is_query
      t.boolean :is_public

      t.timestamps
    end

  end

  def self.down
    drop_table :terms
	end    
end
