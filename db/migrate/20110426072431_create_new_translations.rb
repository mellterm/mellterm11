class CreateNewTranslations < ActiveRecord::Migration
  def self.up
    create_table :new_translations do |t|
      t.integer :language_id
      t.integer :conceptId
      t.string :content
      t.boolean :is_source
      t.integer :created_by_id
      t.integer :last_updated_by_id
      t.string :term_type
      t.string :part_of_speech
      t.integer :translation_status_id
      t.string :comments
      t.integer :source_id
      t.integer :provider_id
      t.integer :company_id
      t.boolean :is_public

      t.timestamps
    end
  end

  def self.down
    drop_table :new_translations
  end
end
