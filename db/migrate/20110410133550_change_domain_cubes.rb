class ChangeDomainCubes < ActiveRecord::Migration
  def self.up
  	remove_column :domain_cubes, :term_id
  	add_column :domain_cubes, :translation_id, :integer 
  	
  end

  def self.down
  	remove_column :domain_cubes, :translation_id
  	add_column :domain_cubes, :term_id, :integer
  end
end
