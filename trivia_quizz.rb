require_relative 'models/roll_dice'
require_relative 'models/team'
require_relative 'models/wait.rb'

require_relative 'repositories/team_repository'
require_relative 'repositories/player_repository'
require_relative 'repositories/question_repository'

require_relative 'controllers/teams_controller'
require_relative 'controllers/players_controller'
require_relative 'controllers/questions_controller'

API = "https://opentdb.com/api_config.php"
token = "LeWagonTriviaGame"

# main file to start the game
@player_repository = PlayerRepository.new
@player_controller = PlayersController.new(@player_repository)

@team_repository = TeamRepository.new
@team_controller = TeamsController.new(@team_repository, @player_repository)

@question_repository = QuestionRepository.new
@questions_controller = QuestionsController.new(@question_repository)

# object needed
RollDice.roll
@questions_controller.token

# Create the teams
# Who wants to play ?
# list_of_players = ["Camille", "Laura", "Betty", "Lucas", "Olie"]
@player_controller.add_players
@player_controller.list

# Make the teams
nb_teams = @team_controller.nb_teams
player_in_teams = @team_controller.place_players_in_teams(nb_teams)

# Name the Team
@team_controller.name_teams(player_in_teams)
@team_controller.list

Wait.wait

# Let's play !
while true
  nb_teams.times do |team_id|
    print `clear`
    team = @team_repository.all[team_id]
    @team_controller.turn_to_play(team)
    check = true
    while check
      question = @questions_controller.new_question(RollDice.roll_category)
      @questions_controller.display_question(question)
      Wait.wait
      @questions_controller.display_answer(question)
      Wait.wait
      check = @questions_controller.check_good_answer
      if check
        nb_points = @questions_controller.score_to_add(question)
        team.score += nb_points
        @questions_controller.display_message_win(nb_points)
        check = false
      else
        @questions_controller.display_message_loose
      end
      @team_controller.list_score
      Wait.wait
    end
  end
end


#display a question
# Team answer it
# if ok score a point
# if not don't score !

