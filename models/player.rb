class Player
  attr_reader :name
  attr_accessor :score, :color

  def initialize(arg = {})
    @name = arg[:name]
  end
end
