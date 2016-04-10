FactoryGirl.define do  
  sequence :preference do |n|
    ['M', 'F', 'Q', 'T'].sample
  end
  sequence :gender do |n|
    ['M', 'F', 'Q', 'T'].sample
  end
  sequence :interest_name do |n|
    ['Horseback Riding', 'Hiking', 'Coffee', 'Dancing', 'Partying', 'Art', 'Politics', 'Romance', 'Fun', 'Sports', 'Traveling', 'Hop Scotch', 'Food', 'Cuddling', 'Being a Bro', 'Exercise', 'Running', 'Languages', 'Movies', 'Fishing', 'Biking', 'Yoga', 'Family', 'Animals', 'Cooking', 'Smoking', 'Drinking', 'Holding Hands'].sample
  end


  factory :user do 
    name { Faker::Name.name }
    gender
    dob { Faker::Date.between(100.years.ago, 18.years.ago) }
    location { Faker::Address.zip }
    preference
    email { Faker::Internet.email }
    photos { Faker::Placeholdit.image }
    interests {[FactoryGirl.create(:interest)]}

    # status 'International'
  end

  factory :interest do
    interest_name
    # users {[FactoryGirl.create(:user)]}
  end

  factory :citizen do
    association :user, factory: :user, status: "Citizen"
  end

  factory :international do
    association :user, factory: :user, status: "International"
  end

end    
  # factory :user_interest do
  #   user { FactoryGirl.create(:user) }
  #   interest
  # end  

  # factory :user_with_interest, :parent => :user do
  #   interests {[FactoryGirl.create(:interest)]}
  # end      



  # post factory with a `belongs_to` association for the user
  # factory :citizen do
  #   user
  # end

  

  