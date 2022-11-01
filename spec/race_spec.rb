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
      
      # binding.pry
      expect(candidate1.class).to eq(Candidate)
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)
      expect(race.candidates).to eq([candidate1])
      
      candidate2 = race.register_candidate!(
                  {
                  name: "Roberto R", 
                  party: :republican
                  })
      
      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end
  
  describe 'Iteration 4' do
    let (:race1) {Race.new("Texas Governor")}
    let (:race2) {Race.new("Virginia District 4 Representative")}
    
    
    
    
    it 'can determine if a race is open, close it, and determine the winner' do
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      
      expect(race1.open?).to be(true)
      expect(race1.winner).to be(false)
      
      race1.close!
      
      expect(race1.winner).to eq(candidate1)
    end
    
    it 'can recognize a tie' do
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      
      1.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}
      
      race1.close!
      race2.close!
      
      expect(race1.tie?).to eq(false)
      expect(race2.tie?).to eq(true)
      # binding.pry
    end
  end
end