class ChangeProviders < ActiveRecord::Migration
  def self.up
  	change_table(:providers) do |t|
  		t.string :image
  		t.integer :default_udc_id
  		t.string :default_source_url
  	end	
  end

  def self.down
  	change_table(:providers) do |t|
  		t.remove :image
  		t.remove :udc_id
  		t.remove :default_source_url
  	end	
  end
end
