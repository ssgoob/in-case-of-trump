FactoryGirl.define do
  sequence :gender do |n|
      ['M', 'F', 'Q', 'T'].sample
    end

  sequence :preference do |n|
      ['M', 'F', 'Q', 'T'].sample
    end

  factory :user do
    name { Faker::Name.name }
    gender
    preference
    dob { Faker::Date.between(100.years.ago, 18.years.ago) }
    location { Faker::Address.zip }
    email { Faker::Internet.email } 
  end

  factory :citizen do
    association :user, factory: :user, status: "Citizen"
  end

  factory :international do
    association :user, factory: :user, status: "International"
  end



end