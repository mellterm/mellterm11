# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Currency.delete_all
currencies = Currency.create!([	{:name=> 'EUR', :long_name => 'Euro'}, 
								{:name => 'USD', :long_name => 'US Dollar'}
							])