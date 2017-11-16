require_relative 'roll_dice'
require_relative 'team'

# main file to start the game

# object needed
# all_players = Team.new
dice = RollDice.new

# Create the teams
# Who wants to play ?
# list_of_players = ["Camille", "Laura", "Betty", "Lucas", "Olie"]
list_of_players = Team.add_players
Team.list(list_of_players.shuffle!)

# Make the teams
nb_teams = Team.nb_teams
teams = Team.create_teams(list_of_players.shuffle, nb_teams)
puts "The teams are: #{teams}"


# p dice.roll
