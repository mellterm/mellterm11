class AddIndexToTus < ActiveRecord::Migration
  def self.up
  	add_index :tus, :content
  end

  def self.down
  	remove_index :tus, :content
  end
end
