require_relative 'models/roll_dice'
require_relative 'models/team'

require_relative 'repositories/team_repository'
require_relative 'repositories/player_repository'

require_relative 'controllers/teams_controller'
require_relative 'controllers/players_controller'

# main file to start the game
@player_repository = PlayerRepository.new
@player_controller = PlayersController.new(@player_repository)
@team_repository = TeamRepository.new
@team_controller = TeamsController.new(@team_repository, @player_repository)
# object needed
# all_players = Team.new
dice = RollDice.new

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

