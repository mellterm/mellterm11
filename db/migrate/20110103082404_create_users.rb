class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :skype
      t.string :time_zone
      t.text :notes
      t.integer :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
