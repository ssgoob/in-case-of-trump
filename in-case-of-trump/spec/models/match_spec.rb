# == Schema Information
#
# Table name: matches
#
#  id               :integer          not null, primary key
#  status           :string
#  citizen_id       :integer
#  international_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'
  

describe Match do

  let!(:benjamin) {User.create(name: "Benjamin", preference: 'F', gender: 'M', password: 'password', email: 'email4@memail.com')}
  # let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
  # let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M')}
  let!(:sally) {User.create(name: "Sally", preference: 'M', gender: 'F', password: 'password', email: 'email3@memail.com')}
  let!(:benjamin_international) {International.create(user: benjamin)}
  # let!(:tito_citizen) {Citizen.create(user: tito)}
  # let!(:karen_international) {International.create(user: karen)}
  let!(:sally_citizen) {Citizen.create(user: sally)}
 
  let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F', password: 'password', email: 'email@memail.com')}
  let!(:tito){User.create(name: "Tito", preference: 'F', gender: 'M', password: 'password', email: 'email1@memail.com')}
  let!(:tito_citizen) {Citizen.create(user_id: 11)}
  let!(:karen_international) {International.create(user_id: 10)}
  let!(:tito_karen) {Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "pending i")}
  let!(:benjamin_sally) {Match.create(citizen_id: sally_citizen.id, international_id: benjamin_international.id, status: "pending c")}
  # let!(:match) {Match.create(citizen_id: 5, international_id: 6, status: "pending c")}



  #users, citizen, and international connections


  describe 'conversing users' do
    it 'can count number of users in conversation' do 
      expect(Match.conversing_users).to eq(0)
    end
  end

  describe '.success rate' do
    it 'can measure percentage of users in conversation' do 
      expect(Match.success_rate).to eq(0)
    end
  end

  describe '.failure rate' do
    it 'can measure percentage of users not in any conversation' do 
      expect(Match.failure_rate).to eq(1)
    end
  end


  describe '.match_exist' do
    it 'knows when there is not a pending match' do
      expect(Match.match_exist(tito_citizen.id, 4).length).to eq(0)
    end


    it 'checks whether there is a pending match' do
      expect(Match.match_exist(sally_citizen.id, benjamin_international.id).length).to eq(1)
    end
  end

end
  
