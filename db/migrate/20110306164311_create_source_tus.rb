class CreateSourceTus < ActiveRecord::Migration
  def self.up
    create_table :source_tus do |t|
      t.string :content
      t.integer :language_id
      t.string :definition

      t.timestamps
    end
    add_index :source_tus, :content
  end

  def self.down
    drop_table :source_tus
  end
end
