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
    image { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'Download.png').to_s, 'image/png') }
  end
  
end