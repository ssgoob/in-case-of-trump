FactoryGirl.define do  
  factory :citizen do
    association :user, factory: :user, status: "Citizen", latitude: Faker::Number.between(34.0, 42.0), longitude: Faker::Number.between(-117.0, -81.4)
  end
end