FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end
  
  sequence :rating do |n|
    "#{n}"
  end
	
  factory :admin, class: User do
		first_name "Admin"
    last_name "User"
    email "admin@gmail.com"
    password "12345678"
    password_confirmation "12345678"
		admin true
	end  
  
  factory :user do
    email
    first_name "User"
    last_name "User"
		password "12345678"
    password_confirmation "12345678"
    admin false
  end
  
  factory :order do
    product_id '1'
    user_id '1'
    total '1'
  end
  
  factory :comment do
    user 
    product
    rating
    body "test body"
  end
   
  factory :product do
    name "Test clothing"
    price  "1"
    stock  "1"
    description "test description"
    
    trait :with_comment do
      after(:create) do |product, evaluator|
        product.comments << create(:comment)
      end
    end
  end
  
end