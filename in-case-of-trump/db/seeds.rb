require 'factory_girl_rails'

10.times do
  FactoryGirl.create :citizen
  FactoryGirl.create :international
end

# benjamin_international = International.create(user: benjamin)
# tito_citizen = Citizen.create(user: tito)
# karen_international = International.create(user: karen)
# sally_citizen = Citizen.create(user: sally)

# tito_karen = Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "pending i")
# benjamin_sally = Match.create(citizen_id: sally_citizen.id, international_id: benjamin_international.id, status: "pending c")