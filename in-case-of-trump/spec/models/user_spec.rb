#  name       :string
#  gender     :string
#  dob        :datetime
#  location   :string
#  preference :string
#  interests  :string
#  photos     :string
#  email      :string
#  status     :string
#

require 'spec_helper'

describe User do
  4.times { FactoryGirl.create(:citizen) }
  4.times { FactoryGirl.create(:international) }

#   let!(:felipe) { FactoryGirl.create(:user) }
#   let!(:citizen) { FactoryGirl.create(:citizen) } #makes second user a citizen
#   let!(:lola) { FactoryGirl.create(:user) }
#   let!(:international) { FactoryGirl.create(:international) } #makes forth user an international
# let!(:fun) { FactoryGirl.create(:user_interest) }
  # let!(:userinterest) { FactoryGirl.create(:user_interest) }
  # let!(:felipe2) { FactoryGirl.create(:user) }
  # let!(:benjamin) {User.create(name: "Benjamin", preference: 'F', gender: 'M')}
  let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
  let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M')}
  # let!(:sally) {User.create(name: "Sally", preference: 'M', gender: 'F')}
  # let!(:benjamin_international) {International.create(user: benjamin)}
  let!(:tito_citizen) {Citizen.create(user: tito)}
  let!(:karen_international) {International.create(user: karen)}
  # let!(:sally_citizen) {Citizen.create(user: sally)}
  # let!(:tito_karen) {Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "pending i")}
  # let!(:benjamin_karen) {Match.create(citizen_id: sally_citizen.id, international_id: benjamin_international.id, status: "pending c")}

  #users, citizen, and international connections

  describe '#create' do
    it 'can create many users' do 
binding.pry
      expect(User.all.count).to eq(10)
    end
  end

  describe '#status' do
    it 'can make internationals' do
      expect(karen.status).to eq('International')
      #User.where(status: "International").length to eq(5)
    end

    it 'can make citizens' do
      expect(tito.status).to eq('Citizen')
      #User.where(status: "Citizen").length to eq(5)
    end
  end 


  #user methods
  describe '#all possible matches' do
    it 'returns all matches if citizen by status and matched preference' do
      expect(tito.all_matches).to include(karen)
    end

    it 'returns all matches if international by status and matched preference' do
      expect(karen.all_matches).to include(tito)
    end
  end


  describe '#make_a_match' do
    it 'creates a match when a citizen and an international like each other' do
      expect(tito.make_a_match(karen).to eq(match))
    end

    it 'a match has a citizenId and an international Id' do
      expect(match.citizen_id.to eq(karen.status_id))      
    end
  end



end
  
