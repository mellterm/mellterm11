class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :code
      t.string :long_name
      t.text :notes
      t.string :address	
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
