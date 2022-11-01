class Election
  attr_reader :year,
              :races
  def initialize(year)
    @year = year
    @races = []
  end
  
  def add_race(race)
    @races << race
  end
  
  def candidates
    @races.flat_map do |race|
      race.candidates
    end
  end
  
  def vote_counts
    hash = {}
    candidates.each do |candidate|
      hash[candidate.name] = candidate.votes
    end
    hash
  end
  
  def winners?
    @races.filter_map do |race| #compacts to remove nil from array
      race.winner if race.winner && !race.tie? 
    end
  end
  
end
