Factory.define :user do |user|
	user.name "Bob Dummy User"
	user.email "dan@example.com"
	user.phone "1213123213"
	user.password "foobar"
	user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :term do |term|
	 term.source_content "Der Mann von der Bruecke"
	 term.target_content "The Man from the bridge"
	 term.source_language_id 1
	 term.target_language_id 2
	 term.notes "Some notes about where to use this term"
	 term.is_query true
	 term.user_id 1
	 term.association :user
end