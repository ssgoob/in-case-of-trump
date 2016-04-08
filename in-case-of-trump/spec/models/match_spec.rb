require 'spec_helper'

describe Match do

  let!(:benjamin) {User.create(name: "Benjamin", preference: 'F', gender: 'M')}
  let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
  let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M')}
  let!(:benjamin_international) {International.create(user: benjamin)}
  let!(:tito_citizen) {Citizen.create(user: tito)}
  let!(:karen_international) {International.create(user: karen)}

  #users, citizen, and international connections
  describe 'conversing users' do
    it 'can count number of users in conversation' do 
      expect(Match.conversing_users).to eq(0)
    end
  end

  describe 'success rate' do
    it 'can measure percentage of users in conversation' do 
      expect(Match.success_rate).to eq(0)
    end
  end

  describe 'failure rate' do
    it 'can measure percentage of users not in any conversation' do 
      expect(Match.failure_rate).to eq(1)
    end
  end



end
  