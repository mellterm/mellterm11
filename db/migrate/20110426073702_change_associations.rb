class ChangeAssociations < ActiveRecord::Migration
  def self.up
  	remove_column :associations, :translation_id
  	remove_column :associations, :description
  	add_column :associations, :conceptId, :integer
  	add_column :associations, :association_type_id, :integer
  end

  def self.down
  	remove_column :associations, :conceptId
  	remove_column :associations, :association_type_id
  	add_column :associations, :translation_id, :integer
  end
end
