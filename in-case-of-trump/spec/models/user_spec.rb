require 'spec_helper'

describe User do

  let!(:benjamin) {User.create(name: "Benjamin", preference: 'F', gender: 'M')}
  let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
  let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M')}
  let!(:benjamin_international) {International.create(user: benjamin)}
  let!(:tito_citizen) {Citizen.create(user: tito)}
  let!(:karen_international) {International.create(user: karen)}

  #users, citizen, and international connections
  describe '#create' do
    it 'can create many users' do 
      expect(User.all.count).to eq(3)
    end
  end

  describe '#status' do
    it 'can make internationals' do
      expect(benjamin.status).to eq('International')
    end

    it 'can make citizens' do
      expect(tito.status).to eq('Citizen')
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

  describe '#pick_a_match' do
    it 'allows a user to select a match from all_matches' do
      expect(tito.pick_a_match(karen)).to include(karen) 
      expect(karen.pick_a_match(tito)).to include(tito) 
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
  