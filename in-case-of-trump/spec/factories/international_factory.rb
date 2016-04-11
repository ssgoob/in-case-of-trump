FactoryGirl.define do  
  factory :international do
    association :user, factory: :user, status: "International"
  end
end