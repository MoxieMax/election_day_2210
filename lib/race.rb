class Race
  attr_reader :office,
              :candidates
  def initialize(office)
    @office = office
    @candidates = []
  end
  
  def register_candidate!(attributes)
    new_c = Candidate.new(attributes)
    # @candidates << new_c
  end
end
