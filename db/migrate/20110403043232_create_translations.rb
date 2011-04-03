class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      	t.integer :source_tu_id
      	t.integer :target_tu_id
      	t.boolean :is_public, :default => false
      	t.integer :provider_id
      	t.integer :company_id
      	t.integer :source_id
      	t.string :source_url
      	t.integer :document_id
      	t.integer :user_id
      	t.string :translation_type
      	t.timestamps
    end
    	add_index :translations, :user_id
    
  end

  def self.down
    	drop_table :translations
  end
end

