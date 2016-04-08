require 'spec_helper'

describe User do

  let!(:benjamin) {User.create(name: "Benjamin")}
  let!(:karen) {User.create(name: "Karen")}
  let!(:tito) {User.create(name: "Tito")}
  let!(:benjamin_citizen) {International.create(user: benjamin)}


  describe '#create' do
    it 'can create many users' do 
      expect(User.all.count).to eq(3)
    end
  end

  describe '#status' do
    it 'can make internationals' do
      expect(benjamin.status).to eq('International')
    end

    # it 'can make citizens' do
    #   expect(tito.status).to eq('Citizen')
    # end
  end 

end
  