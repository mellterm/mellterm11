class AddLanguageIndexToTerms < ActiveRecord::Migration
  def self.up
  	add_index :terms, :source_language_id
  	add_index :terms, :target_language_id
  	add_index :terms, :domain_id
  	
  end

  def self.down
  	remove_index :terms, :source_language_id
  	remove_index :terms, :target_language_id
  	remove_index :terms, :domain_id
  end
end
