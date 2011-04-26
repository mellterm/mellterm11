class RemoveCompanyIDfromNewTranslations < ActiveRecord::Migration
  def self.up
  	remove_column :new_translations, :company_id 
  end

  def self.down
  	add_column :new_translations, :company_id, :integer
  end
end
