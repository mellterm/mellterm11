class CreateTus < ActiveRecord::Migration
  def self.up
    create_table :tus do |t|
      t.string :content
      t.integer :language_id
      t.string :definition
      t.boolean :is_source

      t.timestamps
    end
  end

  def self.down
    drop_table :tus
  end
end
