require 'faker'
require 'populator'

	namespace :db do
		desc "Fill database with sample data"
		task :populate => :environment do
			 
			Rake::Task['db:reset'].invoke
			[User, Term, Language, Domain].each(&:delete_all)
			admin = User.create!(
				:name => "Mellterm Admin",
				:email => "admin@mellterm.net",
				:password => "foobar",
				:password_confirmation => "foobar",
				:phone =>"123 457 6382",
				:notes => "lorum ipsum factum",
				:skype => "mellterm",
				:timezone => "UTC",
				:rate => 10
			)
			admin.toggle!(:admin)
	
			10.times do |n|
				name = Faker::Name.name
				email = Faker::Internet.email
				password = "foobar"
				phone = "12312434"
				rate = [3..12].to_a.rand()
				skype = Faker::Internet.user_name
				notes = Faker::Lorem.sentences(1)
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
			
	6.times do |l|
		code = ["de_de", "en_gb", "en_en", "en_us", "fr_fr", "sp_sp"][l]
		long_name = ["German, Germany", "English, England", "English, International", "English, USA",
		"French, France", "Spanish, Spain"][l]
		
		Language.create!(
		:code => code,
		:long_name => long_name
		)			
	end		
			
	14.times do |l|
		code = ["ELEC",
				"GENTECH",
				"AUTO", 
				"LEGAL",
				"COMPUTING",
				"CAD",
				"GENERAL",
				"MACHINE",
				"ENERGY",
				"BUILD",
				"TELECOM",
				"TECHDOC",
				"MARKET",
				"BUSFINA"
				][l]	
		long_name = 
				["Electrical Engineering & Electronics",
				"Non-domain specific technical term",
				"Automotive, Cars & Trucks",
				"Legal, Patents",
				"Computers: Systems, Networks, hardware",
				"Computer Aided Design",
				"General usage",
				"Mechanical Engineering",
				"Energy / Power Generation",
				"Construction / Civil Engineering",
				"Telecom(munications)",
				"Language of technical documentation",
				"Marketing, including slogans",
				"Business Financial"
				][l]
		
		Domain.create!(
		:code => code,
		:long_name => long_name
		)			
	end
	

	User.all(:limit => 6).each do |user|
		50.times do 
			
			source_content =	Populator.words(2..3)
			target_content =	Populator.words(2..3)
			created_at = 	2.months.ago..Time.now
			is_query = [0,1].rand
			is_public = [0,1].rand
			user.terms.create!(
				:source_content => source_content, 
			   	:target_content => target_content, 
			   	:source_language_id => 1+rand(6),
			   	:target_language_id => 1+rand(6),
			   	:domain_id => 1+rand(14),
			   	:is_query => is_query,
				:is_public => is_public,
				:created_at =>  created_at   
			)	
	end
	end
end
end