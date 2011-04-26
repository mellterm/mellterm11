class CreateAssociationTypes < ActiveRecord::Migration
  def self.up
    create_table :association_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :association_types
  end
end
