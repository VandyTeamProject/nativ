FactoryBot.define do
  factory :user do
    sequence :email do |n|
       "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end
  factory :place do
    name { "hello" }
    address { "hello" }
    description { "hello" }
    association :user
  end
  
end