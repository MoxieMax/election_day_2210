class Race
  attr_reader :office,
              :candidates,
              :open
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(attributes)
    new_c = Candidate.new(attributes)
    @candidates << new_c
    new_c
  end
  
  def open?
    @open
  end
  
  def winner
    return false if open? #guard statement
    @candidates.max_by do |candidate|
      candidate.votes
    end
  end
  
  def close!
    @open = false
  end
  
  def tie?
    sorted = @candidates.sort_by do |candidate|
      candidate.votes
      # require 'pry'; binding.pry
    end
    sorted[-1].votes == sorted[-2].votes
    # OR 
    # sorted[0].votes == sorted[1].votes
  end
end
