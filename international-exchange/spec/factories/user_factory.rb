FactoryGirl.define do  
  sequence :preference do |n|
    ['M', 'F', 'Q', 'T'].sample
  end

  sequence :gender do |n|
   rng = [*0..100].sample
    if rng > 60
      'M'
    elsif rng > 20
      'F'
    elsif rng > 10
      'Q'
    else
      'T'
    end
  end
  
  # sequence :interest_name_ do |n|
  #   ['Horseback Riding', 'Hiking', 'Coffee', 'Dancing', 'Partying', 'Art', 'Politics', 'Romance', 'Fun', 'Sports', 'Traveling', 'Hop Scotch', 'Food', 'Cuddling', 'Being a Bro', 'Exercise', 'Running', 'Languages', 'Movies', 'Fishing', 'Biking', 'Yoga', 'Family', 'Animals', 'Cooking', 'Smoking', 'Drinking', 'Holding Hands'].sample
  # end

  sequence(:user_id) do |n|
    (1 + Random.rand(200))
  end  

  sequence(:interest_id) do |n|
    (1 + Random.rand(28))
  end  

  sequence(:rating) do |n|
    (1 + Random.rand(5))
  end  

  sequence(:email) { |n| "test#{n}@email.com" }  

  sequence(:latitude) do |n|
    if(n < 100)
      Faker::Number.between(34.0, 42.0)
    else
      Faker::Number.between(22.0, 49.0)
    end
  end

  sequence(:longitude) do |n|
    if(n < 100)
      Faker::Number.between(-117.0, -81.4)
    else
      Faker::Number.between(0.0, 116.5)
    end
  end
  factory :user do 
    name { Faker::Name.name }
    gender
    latitude
    longitude
    dob { Faker::Date.between(100.years.ago, 18.years.ago) }
    preference
    email
    photos { Faker::Placeholdit.image }
    password "password"
  end

  factory :user_interest do
    user_id
    interest_id
    rating
  end  

end    

  