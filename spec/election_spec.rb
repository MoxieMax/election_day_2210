require 'pry'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  describe 'Iteration 3' do
    let (:election) {Election.new('2022')}
    let (:race1) {Race.new("Virginia District 4 Representative")}
    let (:race2) {Race.new("Texas Governor")}
    
    it 'exists' do
      expect(election).to be_an(Election)
    end
    
    it 'has readable attributes' do
      expect(election.year).to eq('2022')
      expect(election.races).to eq([])
    end
    
    it 'can add races' do
      election.add_race(race1)
      election.add_race(race2)
      
      expect(election.races).to eq([race1, race2])
    end
    
    it 'can add candidates to races' do
      election.add_race(race1)
      election.add_race(race2)
      
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      
      expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4, candidate5])
    end
    
    it 'can tally votes' do
      election.add_race(race1)
      election.add_race(race2)
      
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Diego D", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Rita R", party: :republican})
      candidate5 = race2.register_candidate!({name: "Ida I", party: :independent})
      
      4.times {candidate1.vote_for!}
      1.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      6.times {candidate4.vote_for!}
      6.times {candidate5.vote_for!}
      
      result = {
        "Diana D"=> 4,
        "Roberto R"=> 1,
        "Diego D"=> 10,
        "Rita R"=> 6,
        "Ida I"=> 6
      }
      
      election.vote_counts
    end
    
    it 'can give us the winners of all races' do
      race3 = Race.new("Colorado District 5 Representative")
      
      expect(race3.open?).to be(true)
      
      election.add_race(race1)
      election.add_race(race2)
      election.add_race(race3)
      
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
      
      expect(election.winners?).to eq([candidate1])
    end
  end
end