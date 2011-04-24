class CreateAssociations < ActiveRecord::Migration
  def self.up
    create_table :associations do |t|
      t.integer :translation_id
      t.string :description
      t.references :associable, :polymorphic => true
    end
  end

  def self.down
    drop_table :associations
  end
end
