class ChangeTerms < ActiveRecord::Migration
  def self.up
  	change_table(:terms) do |t|
  		t.remove :source_content, :target_content, :source_language_id, :target_language_id, :domain_id, :source
  		t.integer :source_tu_id
  		t.integer :target_tu_id
  		t.integer :source_id
  		t.string :source_url
  		t.integer :udc_id
  		t.integer :translation_type_id
  		t.string :definition 
  	end
  end

  def self.down
  	change_table(:terms) do |t|	
  		t.remove :source_tu_id, :target_tu_id, :source_id, :source_url, :ucd_id, :translation_type_id, :definition
  		t.string :source_content
  		t.string :target_content
  		t.integer :source_language_id
  		t.integer :target_language_id
  		t.integer :domain_id
  		t.integer :source
  	end
  end
end
