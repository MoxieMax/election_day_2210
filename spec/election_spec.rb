require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  describe 'Iteration 3' do
    let (:election) {Election.new('2022')}
    
    it 'exists' do
      expect(election).to be_an(Election)
    end
    
    it 'has readable attributes' do
      expect(election.year).to eq('2022')
      expect(election.races).to eq([])
    end
  end
end