FactoryGirl.define do  
  factory :international do
    association :user, factory: :user, status: "International", latitude: Faker::Number.between(22.0, 49.0), longitude: Faker::Number.between(0.0, 116.5)
  end
end