require_relative 'models/roll_dice'
require_relative 'models/team'

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
p @questions_controller.token

# Create the teams
# Who wants to play ?
# list_of_players = ["Camille", "Laura", "Betty", "Lucas", "Olie"]
# @player_controller.add_players
# @player_controller.list

# Make the teams
# nb_teams = @team_controller.nb_teams
# player_in_teams = @team_controller.place_players_in_teams(nb_teams)

# Name the Team
# @team_controller.name_teams(player_in_teams)
# @team_controller.list
# @team_controller.list_score

# Let's play !
@questions_controller.new_question(RollDice.roll_category)

#display a question
# Team answer it
# if ok score a point
# if not don't score !

