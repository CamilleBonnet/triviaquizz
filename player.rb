class Player
  attr_reader :name
  attr_accessor :score, :color

  def initialize(arg = {})
    @name = arg[:name]
    @score = arg[:score] || 0
    @color = arg[:color] || "no color"
  end
end
