require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  describe 'Iteration 2' do
    let (:race) {Race.new("Texas Governor")}
    
    it 'exists' do
      expect(race).to be_a(Race)
    end
    
    xit 'has readable attributes' do
      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end
    # expect().to eq()
  end
end