FactoryGirl.define do  
  factory :citizen do
    association :user, factory: :user, status: "Citizen"
  end
end