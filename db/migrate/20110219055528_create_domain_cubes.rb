class CreateDomainCubes < ActiveRecord::Migration
  def self.up
    create_table :domain_cubes do |t|
      t.integer :term_id
      t.integer :domain_id

      t.timestamps
    end
    
    add_index :domain_cubes, :term_id
    add_index :domain_cubes, :domain_id
    #ensures only on term(_translation) matches a domain only once
    add_index :domain_cubes, [:term_id, :domain_id], :unique => true
  end

  def self.down
    drop_table :domain_cubes
  end
end
