require 'faker'
require 'populator'

	namespace :db do
		desc "Fill database with sample data"
		task :populate => :environment do
			Rake::Task['db:reset'].invoke
			
			make_users
			make_conceptdomains
			#make_translations
			#make_subscriptions
			#make_currencies
	
			
		end
		
		desc "Loads initial data needed by application."
  		task :populate => :environment do
  			
  			require 'active_record/fixtures'
  			Dir.glob(RAILS_ROOT + '/db/fixtures/*.yml').each do |file|
  				base_name = File.basename(file, '.*')
  				Fixtures.create_fixtures('db/fixtures', base_name)
  			end
  		end	
		
	end


	def make_users

		[User, Translation, Language, Domain].each(&:delete_all)
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
	end
	
	def make_translations
	  
	  #REPLACE with Make terms each provider gets this vanilla version#
	  
		#to make a translation create two tus for source/target, each tu needs a language.
		 
		
		6.times do |l|
		code = ["de_de", "en_gb", "en_en", "en_us", "fr_fr", "sp_sp"][l]
		long_name = ["German, Germany", "English, England", "English, International", "English, USA",
		"French, France", "Spanish, Spain"][l]
		
		Language.create!(
		:code => code,
		:long_name => long_name
		)			
		end		
			
			
		25.times do |t|
			
			source_content =	Populator.words(2..3)
			target_content =	Populator.words(2..3)
			
				SourceTu.create!(
					:content => source_content,
					:language_id => 1+rand(6)
				)
				
				TargetTu.create!(
					:content => target_content,
					:language_id => 1+rand(6)	
				)
					
		
		end	

		User.all(:limit => 6).each do |user|
			
			provider_name = "Provider Dont Care"
			provider_description = "This is a provider"
			
			
			provider = user.providers.create!(
				:provider_name => provider_name ,
				:description =>  provider_description
			)
			
			25.times do 
			
			source_tu_id = 1+rand(SourceTu.count)
			target_tu_id = 1+rand(TargetTu.count)
			created_at =  2.days.ago..Time.now
			is_public = [0,1].rand
			source_url = "http://www.somewhere.com"
			translation_type = "term"
			
				provider.translations.create!(
				
				:source_tu_id => source_tu_id,
				:target_tu_id => target_tu_id,
				:is_public => is_public,
				:translation_type => translation_type,
				:created_at =>  created_at   
				)
			end				
		end
	

	end
	
	
	
	#subscriptions must be changed -> user to provider
	def make_subscriptions
		
		
		users = User.all
		user = users.first
		subscribees = users[1..50]	
		subscribers = users[3..40]
		
		subscribees.each { |subscribee| user.subscribe_to!(subscribee)}
		subscribers.each { |subscriber| subscriber.subscribe_to!(user)}
	end
	
	
	

	def make_domains
	#domains now in domains.yml
		
		domain_id = (1..(Domain.count)).to_a
		translation_id = (1..(Translation.count)).to_a
	
		
	end	
	
	def make_conceptdomains 	

		15.times do |n|
			ConceptDomain.create!(
				:concept_id => n,
				:domain_id => n
			)

		end
	end		
	