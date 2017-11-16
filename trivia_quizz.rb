require_relative 'roll_dice.rb'
require_relative 'team.rb'

# main file to start the game

# object needed
all_players = Team.new
dice = RollDice.new

# Create the teams
# Who wants to play ?
list_of_players = ["Camille", "Laura", "Betty", "Lucas", "Olie"]
# list_of_players = all_players.add_players
all_players.list(list_of_players)

# Make the teams
nb_teams = all_players.nb_teams
teams = all_players.create_teams(list_of_players, nb_teams)



# p dice.roll
