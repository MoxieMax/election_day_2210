require './lib/candidate'

RSpec.describe Candidate do
  describe 'Iteration 1' do
    let (:diana) {Candidate.new({name: "Diana D", party: :democrat})}
    
    it 'exists' do
      expect(diana).to be_a(Candidate)
    end
    
    it 'has readable attributes' do
      expect(diana.name).to eq("Diana D")
      expect(diana.party).to eq(:democrat)
    end
    
    it 'can count votes' do
      expect(diana.votes).to eq(0)
      diana.vote_for!
      diana.vote_for!
      diana.vote_for!
      expect(diana.votes).to eq(3)
      diana.vote_for!
      expect(diana.votes).to eq(4)
    end
  end
  #iteration 2
end
