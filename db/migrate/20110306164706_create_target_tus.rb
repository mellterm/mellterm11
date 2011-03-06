class CreateTargetTus < ActiveRecord::Migration
  def self.up
    create_table :target_tus do |t|
      t.string :content
      t.integer :language_id
      t.string :definition

      t.timestamps
    end
    add_index :target_tus, :content
  end

  def self.down
    drop_table :target_tus
  end
end
