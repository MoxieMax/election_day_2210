require 'pry'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  describe 'Iteration 2' do
    let (:race) {Race.new("Texas Governor")}
    
    it 'exists' do
      expect(race).to be_a(Race)
    end
    
    it 'has readable attributes' do
      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end
    
    it 'can register candidates' do
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      binding.pry
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(race.candidates).to eq([candidate1])
      
      
      
      expect(race.candidate).to eq([candidate1, candidate2])
    end
    # expect().to eq()
  end
end