class RenameTerms < ActiveRecord::Migration
  def self.up
  	rename_table :terms, :term_translations
  end

  def self.down
  	rename_table :term_translations, :terms
  end
end
