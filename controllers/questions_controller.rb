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
    question_parsed = Parsing.new_question_creation(id, @token)
    if question_parsed["response_code"] == 0
      arg_type = question_parsed["results"][0]["type"]
      arg_diff = question_parsed["results"][0]["difficulty"]
      arg_ques = question_parsed["results"][0]["question"]
      arg_resu = question_parsed["results"][0]["correct_answer"]
      Question.new(question: arg_ques, answer: arg_resu, difficulty:arg_diff, type:arg_type)
    else
      puts "BUG"
    end
  end

  def display_question(question)
    View.display_question(question)
  end

  def display_answer(question)
    View.display_answer(question)
  end

  def check_good_answer
    View.check_good_answer
  end

  def score_to_add(question)
    case question.difficulty
    when "easy" then 1
    when "medium" then 2
    when "hard" then 3
    else p "BUUG"
    end
  end

  def display_message_win(nb_points)
    View.display_message_win(nb_points)
  end

  def display_message_loose
    View.display_message_loose
  end

end
