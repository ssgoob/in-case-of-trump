require 'spec_helper'


describe Conversation do

# let!(:karen) {User.create(name: "Karen", preference: 'M', gender: 'F')}
# let!(:tito) {User.create(name: "Tito", preference: 'F', gender: 'M' )}

# let!(:tito_citizen) {Citizen.create(user: tito)}
# let!(:karen_international) {International.create(user: karen)}

# let!(:tito_karen) {Match.create(citizen_id: tito_citizen.id, international_id: karen_international.id, status: "Matched")}


# 4.times {FactoryGirl.create(:citizen) }
# 5.times {FactoryGirl.create(:international) }
# 9.times {FactoryGirl.create(:user_interest) }

           
describe '#create_conversation' do
    it 'creates a conversation once a match is made' do
      
      tito.make_a_match(karen)
      karen.make_a_match(tito)
      expect(Match.first.status).to eq("Matched")
      expect(Conversation.first.match_id).to eq(Match.first.id)
    end
  end

end

