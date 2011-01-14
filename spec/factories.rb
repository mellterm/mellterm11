Factory.define :user do |user|
	user.name "Michael Hartl"
	user.email "mhartl@example.com"
	user.phone "1213123213"
	user.password "foobar"
	user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end