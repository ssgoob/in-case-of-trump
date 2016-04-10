require 'spec_helper'


describe User do
  let!(:hr) {Interest.create(interest_name: 'Horseback Riding')}
  let!(:hiking) {Interest.create(interest_name: 'Hiking')}
  let!(:coffee) {Interest.create(interest_name: 'Coffee')}
  let!(:dancing) {Interest.create(interest_name: 'Dancing')}
  let!(:partying) {Interest.create(interest_name: 'Partying')}
  let!(:art) {Interest.create(interest_name: 'Art')}
  let!(:politics) {Interest.create(interest_name: 'Politics')}
  let!(:romance) {Interest.create(interest_name: 'Romance')}
  let!(:fun) {Interest.create(interest_name: 'Fun')}
  let!(:sports) {Interest.create(interest_name: 'Sports')}
  let!(:traveling) {Interest.create(interest_name: 'Traveling')}
  let!(:hop_scotch) {Interest.create(interest_name: 'Hop Scotch')}
  let!(:food) {Interest.create(interest_name: 'Food')}
  let!(:cuddling) {Interest.create(interest_name: 'Cuddling')}
  let!(:being_a_bro) {Interest.create(interest_name: 'Being a Bro')}
  let!(:exercise) {Interest.create(interest_name: 'Exercise')}
  let!(:running) {Interest.create(interest_name: 'Running')}
  let!(:languages) {Interest.create(interest_name: 'Languages')}
  let!(:movies) {Interest.create(interest_name: 'Movies')}
  let!(:fishing) {Interest.create(interest_name: 'Fishing')}
  let!(:biking) {Interest.create(interest_name: 'Biking')}
  let!(:yoga) {Interest.create(interest_name: 'Yoga')}
  let!(:family) {Interest.create(interest_name: 'Family')}
  let!(:animals) {Interest.create(interest_name: 'Animals')}
  let!(:cooking) {Interest.create(interest_name: 'Cooking')}
  let!(:smoking) {Interest.create(interest_name: 'Smoking')}
  let!(:drinking) {Interest.create(interest_name: 'Drinking')}
  let!(:holding_hands) {Interest.create(interest_name: 'Holding Hands')}

  4.times { FactoryGirl.create(:user_interest) }
  4.times { FactoryGirl.create(:citizen) }
  4.times { FactoryGirl.create(:international) }

  let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F',)}
  let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M', )}
  let!(:tito_citizen) {Citizen.create(user: tito)}
  let!(:karen_international) {International.create(user: karen)}
  let!(:tito_karen) {Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "pending c")}

  describe '#create' do
    it 'can create many users' do 
      expect(User.all.count).to eq(10)
      expect(International.all.count).to eq(5)
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
      expect(tito.all_matches).to include(karen)
    end

    it 'returns all matches if international by status and matched preference' do
      expect(karen.all_matches).to include(tito)
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
  
