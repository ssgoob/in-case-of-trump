require 'spec_helper'

describe 

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

  4.times {FactoryGirl.create(:citizen) }
  5.times {FactoryGirl.create(:international) }
  9.times {FactoryGirl.create(:user_interest) }