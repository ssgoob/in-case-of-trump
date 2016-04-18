require 'spec_helper'

describe User do

  ['Horseback Riding', 'Hiking', 'Coffee', 'Dancing', 'Partying', 'Art', 'Politics', 'Romance', 'Fun', 'Sports', 'Traveling', 'Hop Scotch', 'Food', 'Cuddling', 'Being a Bro', 'Exercise', 'Running', 'Languages', 'Movies', 'Fishing', 'Biking', 'Yoga', 'Family', 'Animals', 'Cooking', 'Smoking', 'Drinking', 'Holding Hands'].each do |interest|
    Interest.create(interest_name: interest)
  end
    
    let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F', password: 'password', email: 'email@memail.com')}
    let!(:tito){User.create(name: "Tito", preference: 'F', gender: 'M', password: 'password', email: 'email1@memail.com')}
    let!(:tito_citizen) {Citizen.create(user_id: 11)}
    let!(:karen_international) {International.create(user_id: 10)}
    let!(:match) {Match.create(citizen_id: 5, international_id: 6, status: "pending c")}


  describe '#create' do
    it 'can create many users' do 
      expect(User.all.count).to eq(11)
      expect(International.all.count).to eq(6)
      expect(Citizen.all.count).to eq(5)
    end
  end

  describe '#status' do
    it 'can make internationals' do
      expect(karen.status).to eq('International')
    end

    it 'can make citizens' do
      expect(tito.status).to eq('Citizen')  
    end
  end 

  describe '#all possible matches' do
    it 'returns all matches if citizen by status and matched preference' do
      expect(tito.potential_matches).to include(karen)
    end

    it 'returns all matches if international by status and matched preference' do
      expect(karen.potential_matches).to include(tito)
    end
  end

  describe '#make_a_match' do
    it 'creates a match when a citizen and an international like each other' do
      expect(tito.make_a_match(karen).status).to eq('Matched')
    end

    it 'a match has a citizenId' do
      expect(tito.make_a_match(karen).citizen_id).to eq(tito.status_id) 
    end

    it 'a match has a citizenId and an international Id' do
      expect(tito.make_a_match(karen).international_id).to eq(karen.status_id)
    end
  end



end
  
