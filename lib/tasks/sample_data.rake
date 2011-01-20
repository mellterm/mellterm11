require 'faker'

	namespace :db do
		desc "Fill database with sample data"
		task :populate => :environment do
			
			Rake::Task['db:reset'].invoke
			
			admin = User.create!(
				:name => "Example User",
				:email => "example@railstutorial.org",
				:password => "foobar",
				:password_confirmation => "foobar",
				:phone =>"1234",
				:notes => "lorum ipsum factum",
				:skype => "my skype",
				:timezone => "UTC",
				:rate => 0.10
			)
			admin.toggle!(:admin)
	
			99.times do |n|
				name = Faker::Name.name
				email = "example-#{n+1}@railstutorial.org"
				password = "password"
				phone = "1234"
				rate = 0.01
				skype = "my skype"
				notes = "lorum ipsum factum"
				timezone = "UTC"

			User.create!(
				:name => name,
				:email => email,
				:password => password,
				:password_confirmation => password,
				:phone => phone,
				:notes => notes,
				:skype => skype,
				:timezone => timezone,
				:rate => rate
			)
			end
			

	User.all(:limit => 6).each do |user|
		50.times do 
			user.terms.create!(
				:source_content => "deutscher Begriff", 
			   	:target_content => "englischer Begriff", 
			   	:source_language_id => 1+rand(3),
			   	:target_language_id => 1+rand(3),
			   	:domain_id =>1+rand(4)	
			)	
	end
	end
end
end