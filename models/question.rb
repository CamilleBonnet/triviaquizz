class Question
  attr_reader :question, :answer, :difficulty, :type

  def initialize(arg = {})
    @question = arg[:question]
    @answer = arg[:answer]
    @difficulty = arg[:difficulty]
    @type = arg[:type]
  end
end
