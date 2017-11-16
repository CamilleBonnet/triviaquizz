class Team
  attr_reader :name, :players
  attr_accessor :score

  def initialize(arg = {})
    @name = arg[:name]
    @score = arg[:score] || 0
    @players = arg[:players]
  end
end
