class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers do |t|
      t.string :name
      t.integer :source_language_id
      t.integer :target_language_id
      t.text :notes
      t.integer :default_domain_id
      t.boolean :default_is_query
      t.boolean :default_is_public
      t.integer :default_source_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
