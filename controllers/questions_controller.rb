require_relative '../view/view'
require_relative '../models/parsing'
require_relative '../models/question'

class QuestionsController
  def initialize(question_repository)
    @question_repository = question_repository
    @token = ""
  end

  def token
    @token = Parsing.token_creation
  end

  def new_question(id)
    quesion = Parsing.new_question_creation(id, @token)
    p quesion
  end

end
