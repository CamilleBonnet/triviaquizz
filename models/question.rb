class Question
  attr_reader :question, :answer, :difficulty

  def initialize(arg = {})
    @question = arg[:question]
    @answer = arg[:answer]
    @difficulty = arg[:difficulty]
  end
end
