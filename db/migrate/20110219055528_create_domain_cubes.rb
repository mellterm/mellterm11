class CreateDomainCubes < ActiveRecord::Migration
  def self.up
    create_table :domain_cubes do |t|
      t.integer :translation_id
      t.integer :domain_id

      t.timestamps
    end
    
    add_index :domain_cubes, [:translation_id, :domain_id], :unique => true
  end

  def self.down
    drop_table :domain_cubes
  end
end
