FactoryGirl.define do
	factory :user do
    first_name "User"
    last_name "User"
    email "user@gmail.com"
		password "12345678"
    password_confirmation "12345678"
    admin false
  end
  
  factory :admin, class: User do
		first_name "Admin"
    last_name "User"
    email "admin@gmail.com"
    password "12345678"
    password_confirmation "12345678"
		admin true
	end
end