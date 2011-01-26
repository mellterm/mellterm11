class AddUserFields < ActiveRecord::Migration
  def self.up
	remove_column :users, :rate
	
	add_column	:users, :city_name, :string
	add_column	:users, :native_language_id, :integer	
	add_column	:users, :preferred_language_id, :integer
	add_column	:users, :provider_id, :integer
	add_column	:users, :credit_balance, :integer, :default => 0.00
	
	
  end

  def self.down
	add_column :users, :rate, :integer
	remove_column	:users, :city_name
	remove_column	:users, :native_language_id	
	remove_column	:users, :preferred_language_id
	remove_column	:users, :provider_id
	remove_column	:users, :credit_balance
  end
end
