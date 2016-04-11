require 'spec_helper'

describe Conversation do

let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M' )}
let!(:tito_citizen) {Citizen.create(user: tito)}
let!(:karen_international) {International.create(user: karen)}
let!(:tito_karen) {Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "Matched")}


           
describe '#create_conversation' do
    it 'creates a conversation once a match is made' do
      expect(Conversation.all).to include(Match.find_by(1))
    end
  end

end